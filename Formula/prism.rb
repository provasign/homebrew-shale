# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.62.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.62.1/prism-v0.62.1-darwin-amd64"
      sha256 "1725301967eb52cefad0902ec93947f21389b08546f03d0c825c8457aed9d80c"

      define_method(:install) do
        bin.install "prism-v0.62.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.62.1/prism-v0.62.1-darwin-arm64"
      sha256 "3ffc53b4baacb7d6c363e71ac5304be3eb76a3ecf8b63555c37b1f999e4685b9"

      define_method(:install) do
        bin.install "prism-v0.62.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.62.1/prism-v0.62.1-linux-amd64"
      sha256 "2a3b505c3a842c44d64f734cffadc0f0a94ce4d8777c4312a5cfe1a19fbfcce6"

      define_method(:install) do
        bin.install "prism-v0.62.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.62.1/prism-v0.62.1-linux-arm64"
      sha256 "159f81759caefa77e0dea5c155046d8c0ae363287c4e2a1d29dd22d154b4f643"

      define_method(:install) do
        bin.install "prism-v0.62.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
