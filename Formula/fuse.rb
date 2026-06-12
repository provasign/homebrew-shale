# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.8.1/fuse-v0.8.1-darwin-amd64"
      sha256 "fdc1c46c82f6c30c0b5e77d26dd06e875532466a29082a4d4aacc9321d131275"

      define_method(:install) do
        bin.install "fuse-v0.8.1-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.8.1/fuse-v0.8.1-darwin-arm64"
      sha256 "65df879e674158c8797204fee9baa4ab0db741ebd38ce699488294325ae28f0d"

      define_method(:install) do
        bin.install "fuse-v0.8.1-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.8.1/fuse-v0.8.1-linux-amd64"
      sha256 "897ffee5fd9894dddd993227b27586ac10968f4c1c0a4e33122a15008732edbd"
      define_method(:install) do
        bin.install "fuse-v0.8.1-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.8.1/fuse-v0.8.1-linux-arm64"
      sha256 "1ec25d3c3fea1273b2333546526c1c452b183747b8008f323726b07e1dafce5f"
      define_method(:install) do
        bin.install "fuse-v0.8.1-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
