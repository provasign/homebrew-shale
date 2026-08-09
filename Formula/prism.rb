# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.39.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.39.1/prism-v0.39.1-darwin-amd64"
      sha256 "0eef16a2a7bf2114bd94263265d808e9f15319d7710eb0f942684ffe463dc2f6"

      define_method(:install) do
        bin.install "prism-v0.39.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.39.1/prism-v0.39.1-darwin-arm64"
      sha256 "c339aa4379a45a2c150048a5ea92e72561c7d59d0fb7c0f47976537e4b8f38e1"

      define_method(:install) do
        bin.install "prism-v0.39.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.39.1/prism-v0.39.1-linux-amd64"
      sha256 "91d1dedd9221015cd44c68d313ceb83c24ce60ce3113877d806296ab66ef008f"

      define_method(:install) do
        bin.install "prism-v0.39.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.39.1/prism-v0.39.1-linux-arm64"
      sha256 "de04660b3b7c53c90a82c6e06b4bb91803d78db31456e1a59f73d6db3edd1492"

      define_method(:install) do
        bin.install "prism-v0.39.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
