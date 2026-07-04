# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.13.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.13.1/fuse-v0.13.1-darwin-amd64"
      sha256 "dc72fc3fc3ebbdcde9d4d23a896131d0cdd851474e9952b9155e25a86f679816"

      define_method(:install) do
        bin.install "fuse-v0.13.1-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.13.1/fuse-v0.13.1-darwin-arm64"
      sha256 "837e16f5168e3c9a8ce5619f37a8a80b6301f15bfb210f2f5820f1718a67fbdc"

      define_method(:install) do
        bin.install "fuse-v0.13.1-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.1/fuse-v0.13.1-linux-amd64"
      sha256 "522a24d317d98de56fcb8e224e72137093de454242d6a9968ae8273a0b0c804a"
      define_method(:install) do
        bin.install "fuse-v0.13.1-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.1/fuse-v0.13.1-linux-arm64"
      sha256 "3f82bd65e1b6fbccebbd5f345979f789bfb83367b44669c2f3f452444571f92c"
      define_method(:install) do
        bin.install "fuse-v0.13.1-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
