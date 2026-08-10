# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.41.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.41.0/prism-v0.41.0-darwin-amd64"
      sha256 "01d7af39faa38b09d2495ad420b29d137a2ffb5fc049882b3e308aa761adbb2f"

      define_method(:install) do
        bin.install "prism-v0.41.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.41.0/prism-v0.41.0-darwin-arm64"
      sha256 "a51f0d6aa542a003ffb1ad771d5cd0b39ce150e7295c4a3c2e2421658afed0f2"

      define_method(:install) do
        bin.install "prism-v0.41.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.41.0/prism-v0.41.0-linux-amd64"
      sha256 "883ce84894637360e30b354922e52fac5f8b98d56c52185ccdff75f694ce0a29"

      define_method(:install) do
        bin.install "prism-v0.41.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.41.0/prism-v0.41.0-linux-arm64"
      sha256 "dbb00eac26942796348d1c9ca0e033abba83584d3a5bd345589708a8d623a34d"

      define_method(:install) do
        bin.install "prism-v0.41.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
