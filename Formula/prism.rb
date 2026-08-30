# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.61.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.61.0/prism-v0.61.0-darwin-amd64"
      sha256 "24293b61219d6694dcb9924e89b250ba0ba2aecc3a3ea4810d6d13578e1cb4fd"

      define_method(:install) do
        bin.install "prism-v0.61.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.61.0/prism-v0.61.0-darwin-arm64"
      sha256 "d9c119459f7e04ca83f71519ae6e372c61534a6fc5fe0794e831fb61fe7dc6aa"

      define_method(:install) do
        bin.install "prism-v0.61.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.61.0/prism-v0.61.0-linux-amd64"
      sha256 "801bb959d5ec753f4b50d1993dd7ff168fe3ae7fa0a7b5ea2e1fc026ba00aa4d"

      define_method(:install) do
        bin.install "prism-v0.61.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.61.0/prism-v0.61.0-linux-arm64"
      sha256 "151967d98a8595d868b1f82ed8ea770566a70234315753b2979cf4a32192dcc7"

      define_method(:install) do
        bin.install "prism-v0.61.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
