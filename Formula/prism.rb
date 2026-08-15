# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.52.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.52.1/prism-v0.52.1-darwin-amd64"
      sha256 "ab0d9c79a1d2dd62fc473f8742d482358819c664cd4af75179d4ca0a16bfcf9a"

      define_method(:install) do
        bin.install "prism-v0.52.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.52.1/prism-v0.52.1-darwin-arm64"
      sha256 "1d389f8635e4a8ca03b070f1a5447a92e131be2fb837cb8b4bfc81945e00bb82"

      define_method(:install) do
        bin.install "prism-v0.52.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.52.1/prism-v0.52.1-linux-amd64"
      sha256 "7a5fd0c7c6d42b8682c47434ee73870cbdd5f96f383c2856b4ee4ccdcf45d67b"

      define_method(:install) do
        bin.install "prism-v0.52.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.52.1/prism-v0.52.1-linux-arm64"
      sha256 "d72f4a88a5c899417e3f1bca03213eb99d200c2f80fb57c99b2115674084bca7"

      define_method(:install) do
        bin.install "prism-v0.52.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
