# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.4/prism-v0.19.4-darwin-amd64"
      sha256 "7883ac4ca4d1def12f4f5fa028dc7368b485c341f07ad3f6d88ffc440c1bdc21"

      define_method(:install) do
        bin.install "prism-v0.19.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.4/prism-v0.19.4-darwin-arm64"
      sha256 "9d7133c00e25c0853c9b3fbc6ace44b4b56b5ff7dbdb9a91e0a252bb0b277216"

      define_method(:install) do
        bin.install "prism-v0.19.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.4/prism-v0.19.4-linux-amd64"
      sha256 "0d232a1595ca58bc0ddcc1dfa2fdb0c58d01de0eae8aaaec17f08cf5c246564f"
      define_method(:install) do
        bin.install "prism-v0.19.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.4/prism-v0.19.4-linux-arm64"
      sha256 "f4cfb09cae6fc09f4cfc7d16350dcd3b3c15a446812536baba6307221b11c1ce"
      define_method(:install) do
        bin.install "prism-v0.19.4-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Register Prism with your AI tools from a project root:
        prism init . --mode both
    EOS
  end

  test do
    system "#{bin}/prism", "version"
  end
end
