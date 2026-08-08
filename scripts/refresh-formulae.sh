#!/usr/bin/env bash
# Regenerate any formula whose version is behind its repo's latest release.
#
# Why this lives in the tap rather than in each tool's release workflow: that
# arrangement needs a cross-repo push token in every tool repo. shale had one;
# prism and mason never did, so their formulae silently froze at 0.23.0 and
# 0.15.0 while 15 and 16 releases shipped. A workflow here writes to its own
# repository with the built-in GITHUB_TOKEN, so there is no secret to forget.
set -euo pipefail

TOOLS=("prism" "mason" "fuse" "shale")
changed=0

for tool in "${TOOLS[@]}"; do
  formula="Formula/${tool}.rb"
  [ -f "${formula}" ] || { echo "${tool}: no formula, skipping"; continue; }

  ver="$(gh release view --repo "provasign/${tool}" --json tagName --jq .tagName 2>/dev/null || true)"
  [ -n "${ver}" ] || { echo "${tool}: no release found, skipping"; continue; }
  num="${ver#v}"
  cur="$(grep -m1 'version "' "${formula}" | sed 's/.*"\(.*\)".*/\1/')"

  if [ "${cur}" = "${num}" ]; then
    echo "${tool}: ${cur} — current"
    continue
  fi

  sums="$(mktemp)"
  if ! gh release download "${ver}" --repo "provasign/${tool}" \
        --pattern "checksums.txt" --output "${sums}" --clobber 2>/dev/null; then
    echo "::warning::${tool} ${ver} has no checksums.txt — formula left at ${cur}"
    continue
  fi

  sha() { grep -E "${tool}-${ver}-$1\$" "${sums}" | awk '{print $1}'; }
  da="$(sha darwin-amd64)"; dr="$(sha darwin-arm64)"
  la="$(sha linux-amd64)";  lr="$(sha linux-arm64)"
  if [ -z "${da}" ] || [ -z "${dr}" ] || [ -z "${la}" ] || [ -z "${lr}" ]; then
    echo "::warning::${tool} ${ver} is missing a platform checksum — formula left at ${cur}"
    continue
  fi

  # Keep the human-written description; only versions and hashes are generated.
  desc="$(grep -m1 'desc "' "${formula}" | sed 's/.*desc "\(.*\)"/\1/')"
  class="$(grep -m1 '^class ' "${formula}" | awk '{print $2}')"
  base="https://github.com/provasign/${tool}/releases/download/${ver}"

  cat > "${formula}" <<FORMULA
# typed: false
# frozen_string_literal: true

class ${class} < Formula
  desc "${desc}"
  homepage "https://github.com/provasign/${tool}"
  version "${num}"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "${base}/${tool}-${ver}-darwin-amd64"
      sha256 "${da}"

      define_method(:install) do
        bin.install "${tool}-${ver}-darwin-amd64" => "${tool}"
      end
    end
    if Hardware::CPU.arm?
      url "${base}/${tool}-${ver}-darwin-arm64"
      sha256 "${dr}"

      define_method(:install) do
        bin.install "${tool}-${ver}-darwin-arm64" => "${tool}"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "${base}/${tool}-${ver}-linux-amd64"
      sha256 "${la}"

      define_method(:install) do
        bin.install "${tool}-${ver}-linux-amd64" => "${tool}"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "${base}/${tool}-${ver}-linux-arm64"
      sha256 "${lr}"

      define_method(:install) do
        bin.install "${tool}-${ver}-linux-arm64" => "${tool}"
      end
    end
  end

  test do
    assert_match "${tool}", shell_output("#{bin}/${tool} version")
  end
end
FORMULA
  echo "${tool}: ${cur} -> ${num}  UPDATED"
  changed=1
done

exit $(( changed == 1 ? 0 : 0 ))
