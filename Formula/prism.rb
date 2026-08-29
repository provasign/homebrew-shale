# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.1/prism-v0.56.1-darwin-amd64"
      sha256 "6ee31518fb9ebe7d68383e79c7aee5fa53e7bae4ae6df991415f067febea1e0e"

      define_method(:install) do
        bin.install "prism-v0.56.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.1/prism-v0.56.1-darwin-arm64"
      sha256 "e60effe4b5699f67b3ce80a46aedfe198dbe5dff2927bc5c12891aba7fdb172b"

      define_method(:install) do
        bin.install "prism-v0.56.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.1/prism-v0.56.1-linux-amd64"
      sha256 "05d002eb77966b2381139e04f7458ce2710e814c5e4a3368a329ecfb16863f4d"

      define_method(:install) do
        bin.install "prism-v0.56.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.1/prism-v0.56.1-linux-arm64"
      sha256 "93e3c13e043ccf21017c068e0ac3a0375e0fed6973364d853cc718ed756201da"

      define_method(:install) do
        bin.install "prism-v0.56.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
