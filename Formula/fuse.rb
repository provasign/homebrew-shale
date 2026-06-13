# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.12.0/fuse-v0.12.0-darwin-amd64"
      sha256 "2acbe23e8ea4533d498c5154c09ed2bd0b83bbbaa1c473460d17a402aa19223d"

      define_method(:install) do
        bin.install "fuse-v0.12.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.12.0/fuse-v0.12.0-darwin-arm64"
      sha256 "61a7abac8e77062e02321ff2e0ea7fe953de848545f7e1045b8e423bef1b7031"

      define_method(:install) do
        bin.install "fuse-v0.12.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.12.0/fuse-v0.12.0-linux-amd64"
      sha256 "4d597f092a89ca06637763e3f3924df50184a8cf6fca74e350c002afbc217f02"
      define_method(:install) do
        bin.install "fuse-v0.12.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.12.0/fuse-v0.12.0-linux-arm64"
      sha256 "9482ce929994961280ebab8dd9b53be36c93f79356cf1bf06692829527c98105"
      define_method(:install) do
        bin.install "fuse-v0.12.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
