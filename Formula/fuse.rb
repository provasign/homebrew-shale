# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.13.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.13.3/fuse-v0.13.3-darwin-amd64"
      sha256 "22a3e21c9e9e57699ad2b7d3367015557b0b914a478b692b3046799675bfb7ad"

      define_method(:install) do
        bin.install "fuse-v0.13.3-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.13.3/fuse-v0.13.3-darwin-arm64"
      sha256 "0f33a3381bacb1787f9240548160a028a0d175df13e0299bbc37cb923f555ac1"

      define_method(:install) do
        bin.install "fuse-v0.13.3-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.3/fuse-v0.13.3-linux-amd64"
      sha256 "f60a84e82c08bf7f9f7bde65be103d45862895fc867ca83b91fe1d3ce3d0f161"
      define_method(:install) do
        bin.install "fuse-v0.13.3-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.3/fuse-v0.13.3-linux-arm64"
      sha256 "77ec78ac29f1f9075aee59162c459bde4414efc8e5c31377c9c115f01ea4f64a"
      define_method(:install) do
        bin.install "fuse-v0.13.3-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
