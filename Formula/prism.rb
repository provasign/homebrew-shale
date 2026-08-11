# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.45.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.45.1/prism-v0.45.1-darwin-amd64"
      sha256 "003956095b7867bedb8bb982cc499b074e6e54f7bf2e0c0579d32ea2fb3d16e2"

      define_method(:install) do
        bin.install "prism-v0.45.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.45.1/prism-v0.45.1-darwin-arm64"
      sha256 "1d17aae12347fc203d8be875662936abac955ce0caf7790ad1b2fefe776810d7"

      define_method(:install) do
        bin.install "prism-v0.45.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.45.1/prism-v0.45.1-linux-amd64"
      sha256 "3bf5aaa5371ddb7012305d1a6f17dcf9a4227e4b1f8f17413712a7cb2dd20c62"

      define_method(:install) do
        bin.install "prism-v0.45.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.45.1/prism-v0.45.1-linux-arm64"
      sha256 "7232c73f78c46dea216941463545cd6e4c4ae195bb6a9986d994f631068bcb75"

      define_method(:install) do
        bin.install "prism-v0.45.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
