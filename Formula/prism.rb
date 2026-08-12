# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.48.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.48.0/prism-v0.48.0-darwin-amd64"
      sha256 "89c679c6591e4ddfd7a35f35f2da807415519942fcbaf35fab3e2c50218845ce"

      define_method(:install) do
        bin.install "prism-v0.48.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.48.0/prism-v0.48.0-darwin-arm64"
      sha256 "744555cd787128e58befd3ad510a4f8d8cd8aabba3454048c5aab4275c4bfefa"

      define_method(:install) do
        bin.install "prism-v0.48.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.48.0/prism-v0.48.0-linux-amd64"
      sha256 "7662a49a8b2d73a31a90ba65f8c1ff8594b7e4553003bbcac1e2e0eaaeb15b02"

      define_method(:install) do
        bin.install "prism-v0.48.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.48.0/prism-v0.48.0-linux-arm64"
      sha256 "206f19fb209f595b5e4358b72b83306150529c5c140129d2f028e988128f8286"

      define_method(:install) do
        bin.install "prism-v0.48.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
