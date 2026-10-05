# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.11/prism-v0.85.11-darwin-amd64"
      sha256 "b4357cc7e7bd7da417fa5d9017ed619f4d64529d3926f173c0f5ca32adfdf129"

      define_method(:install) do
        bin.install "prism-v0.85.11-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.11/prism-v0.85.11-darwin-arm64"
      sha256 "92873d5ea3944d5db857819152e5a77502a7ed69dbdee1d884e53aaf3e564451"

      define_method(:install) do
        bin.install "prism-v0.85.11-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.11/prism-v0.85.11-linux-amd64"
      sha256 "e008ab308cdc037238ed22a39dcf4e28d227a1c633015c5f1960292172470b85"

      define_method(:install) do
        bin.install "prism-v0.85.11-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.11/prism-v0.85.11-linux-arm64"
      sha256 "fffc476549d3622bb8272e3bd9ead4cecccfe18313f77eba74396b30e93d0616"

      define_method(:install) do
        bin.install "prism-v0.85.11-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Run `prism init` inside each project after installing or upgrading to
      configure supported AI clients. Prism setup is project-scoped;
      `prism init --global` is no longer supported.

      Restart or reload running AI clients after upgrading Prism.

      Prism reports other installed copies when their versions differ.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
