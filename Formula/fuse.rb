# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.13.0/fuse-v0.13.0-darwin-amd64"
      sha256 "659efe9c4319041dac4ca18b9d42f99fcd626018021ff5b8d5b736e28f0d3325"

      define_method(:install) do
        bin.install "fuse-v0.13.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.13.0/fuse-v0.13.0-darwin-arm64"
      sha256 "82fe5ed66fa03193f09705b8f36655ec609b6323adf4e5d911fc2fa3cfe78df5"

      define_method(:install) do
        bin.install "fuse-v0.13.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.0/fuse-v0.13.0-linux-amd64"
      sha256 "254e43392df5d69848bd53f0483049bc5569956220c1eaf757e3d3a928d3ecc1"
      define_method(:install) do
        bin.install "fuse-v0.13.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.0/fuse-v0.13.0-linux-arm64"
      sha256 "11920aac197673bc3caa749217aa4c00f9be4fddcadd4e119e0b61b227d36a52"
      define_method(:install) do
        bin.install "fuse-v0.13.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
