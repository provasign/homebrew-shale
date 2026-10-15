# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.22"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.22/prism-v0.87.22-darwin-amd64"
      sha256 "4bf15bcca6928c2c9dc6c656586a5adf119ec1213b377234909461aaffa79f66"

      define_method(:install) do
        bin.install "prism-v0.87.22-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.22/prism-v0.87.22-darwin-arm64"
      sha256 "1d4a07a210f5df160035ff2a53f966f5244e46df9a4a1f055793ea1964d5ebab"

      define_method(:install) do
        bin.install "prism-v0.87.22-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.22/prism-v0.87.22-linux-amd64"
      sha256 "1efe670fc7cc6aab6151d5764f5a3dda3e3744580437a38bc2484135919b880d"

      define_method(:install) do
        bin.install "prism-v0.87.22-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.22/prism-v0.87.22-linux-arm64"
      sha256 "abd56ce968fca7ea3fbb252f1e9dc817cda0ff7482d990f644b9b32d9683febf"

      define_method(:install) do
        bin.install "prism-v0.87.22-linux-arm64" => "prism"
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
