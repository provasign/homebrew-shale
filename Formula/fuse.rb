# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.7.0/fuse-v0.7.0-darwin-amd64"
      sha256 "8e858467196133a1f14f424785f84f9c8d4c33b83fc245f71eb0da0ddf7555e8"

      define_method(:install) do
        bin.install "fuse-v0.7.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.7.0/fuse-v0.7.0-darwin-arm64"
      sha256 "3d72de053d9a25f2f99d8c7898054a3159f0e2eed9aa6615ba0ac76c9dd95596"

      define_method(:install) do
        bin.install "fuse-v0.7.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.7.0/fuse-v0.7.0-linux-amd64"
      sha256 "4bc36701104446dcc811b435475460a2554654ce0be10e1f44ccd06204cae1e4"
      define_method(:install) do
        bin.install "fuse-v0.7.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.7.0/fuse-v0.7.0-linux-arm64"
      sha256 "b5a18c23cea7734cdd008a7527a078409308ab6b6947e0ea25e63abd620d8f1e"
      define_method(:install) do
        bin.install "fuse-v0.7.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
