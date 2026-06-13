# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.11.0/fuse-v0.11.0-darwin-amd64"
      sha256 "4de9a4e6e2b1f136c8fcd28dd3e4a0d680b2afa39f421f155e5b2a373e372f21"

      define_method(:install) do
        bin.install "fuse-v0.11.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.11.0/fuse-v0.11.0-darwin-arm64"
      sha256 "fcf14629361265f5d71a9e3f43ecaf16dbc075b6bd959ec972c5f6ffe0ff9cdc"

      define_method(:install) do
        bin.install "fuse-v0.11.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.11.0/fuse-v0.11.0-linux-amd64"
      sha256 "3486e48c4e6b70cf80e35e33f1af9fa8c5a3ffef42d3178723a334ffd8243f34"
      define_method(:install) do
        bin.install "fuse-v0.11.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.11.0/fuse-v0.11.0-linux-arm64"
      sha256 "38852cf013785a64791723d6871ba4d7fb6a4593abfb08b943e7ae06be30933f"
      define_method(:install) do
        bin.install "fuse-v0.11.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
