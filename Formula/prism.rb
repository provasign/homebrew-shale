# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.69.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.69.0/prism-v0.69.0-darwin-amd64"
      sha256 "2cc529385c4e0fe1f5095b846df1ba6d171986fb13368707b5100bf11e9e48c0"

      define_method(:install) do
        bin.install "prism-v0.69.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.69.0/prism-v0.69.0-darwin-arm64"
      sha256 "d4f934d8942d21360be8234321c5fe7c96c6dd081a407ad2488da290d97f63bb"

      define_method(:install) do
        bin.install "prism-v0.69.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.69.0/prism-v0.69.0-linux-amd64"
      sha256 "fdf352fdc64dafd8d3d82200b7b9b38b8056e12da07a8ba8c47f972deb6853a7"

      define_method(:install) do
        bin.install "prism-v0.69.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.69.0/prism-v0.69.0-linux-arm64"
      sha256 "cbd1cd9d71194fbcbe45c4ed04f1a63ed9be550354895af50448b1e01726b043"

      define_method(:install) do
        bin.install "prism-v0.69.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
