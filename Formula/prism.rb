# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.40.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.40.1/prism-v0.40.1-darwin-amd64"
      sha256 "63bee1b67b0337dcde9ea69ab63ad9180237ba6775d6a5036385fcb01b1ddef2"

      define_method(:install) do
        bin.install "prism-v0.40.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.40.1/prism-v0.40.1-darwin-arm64"
      sha256 "d37ba12d229957ffb13bb57ef83abdd1044209e5a02622075eb4a90c54d1de5e"

      define_method(:install) do
        bin.install "prism-v0.40.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.40.1/prism-v0.40.1-linux-amd64"
      sha256 "e72486c2dfce062502afb7b9c6c45a4e9bd7c3ffd696338b8f014a9f44e1a6bb"

      define_method(:install) do
        bin.install "prism-v0.40.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.40.1/prism-v0.40.1-linux-arm64"
      sha256 "4eea8425c07a6df9db9b2ad9e5950edcb8ecc2bdc92708baa9f7cc200d7b0500"

      define_method(:install) do
        bin.install "prism-v0.40.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
