# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.48.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.48.1/prism-v0.48.1-darwin-amd64"
      sha256 "1e017a8fc79989418766d16c5af0265c266128e02cb20a0cf72b7266b7a85756"

      define_method(:install) do
        bin.install "prism-v0.48.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.48.1/prism-v0.48.1-darwin-arm64"
      sha256 "18e65c8ff37c76d3a0f4cf64e4a1302bebe31daa08d09febbc7781ee3354c302"

      define_method(:install) do
        bin.install "prism-v0.48.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.48.1/prism-v0.48.1-linux-amd64"
      sha256 "051a2ab3b6ae09e3b99d8fedb6c8f416569ea45ceebc5ad5d63767e7f19eb3f2"

      define_method(:install) do
        bin.install "prism-v0.48.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.48.1/prism-v0.48.1-linux-arm64"
      sha256 "a9f1731a0d8b9de1f0508972c22eecf2073e9352dce53db9a136b5b5a37af7e2"

      define_method(:install) do
        bin.install "prism-v0.48.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
