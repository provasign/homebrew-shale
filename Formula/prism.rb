# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.9/prism-v0.56.9-darwin-amd64"
      sha256 "955e8f259ddc37595f85374412413c8d3f1f792bffde283ca60bd04a21f877db"

      define_method(:install) do
        bin.install "prism-v0.56.9-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.9/prism-v0.56.9-darwin-arm64"
      sha256 "85a1a9189adf7e84b9f86549001ed1cc097ff88d4a241be4085ae3d96e3077e5"

      define_method(:install) do
        bin.install "prism-v0.56.9-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.9/prism-v0.56.9-linux-amd64"
      sha256 "c7fe690abb9e541361d92213ba3390ab0d660c777f46c7832b40aa7931119e1b"

      define_method(:install) do
        bin.install "prism-v0.56.9-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.9/prism-v0.56.9-linux-arm64"
      sha256 "b8b95ef7b6b48b764a018588c2c4537a30dc008a07e0c1e9deccb622d7f31f0a"

      define_method(:install) do
        bin.install "prism-v0.56.9-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
