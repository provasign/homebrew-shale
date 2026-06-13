# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.10.0/fuse-v0.10.0-darwin-amd64"
      sha256 "4e557f3ffb776e3b36bc73b58f0b083cfa58c3832028ce40b7c5075f17cfaf1e"

      define_method(:install) do
        bin.install "fuse-v0.10.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.10.0/fuse-v0.10.0-darwin-arm64"
      sha256 "73d8a04ed293dcedd179aa878caf337da9c5f25d765accc3d9c1778e687698af"

      define_method(:install) do
        bin.install "fuse-v0.10.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.10.0/fuse-v0.10.0-linux-amd64"
      sha256 "683921234e02e37c2c206afaf01eec1c0d95d4222afadd005d2a0798244cc498"
      define_method(:install) do
        bin.install "fuse-v0.10.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.10.0/fuse-v0.10.0-linux-arm64"
      sha256 "2f3f431333e9967bafeca2b9f4001f1a18bcade88e8780febb32d894b3cd9923"
      define_method(:install) do
        bin.install "fuse-v0.10.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
