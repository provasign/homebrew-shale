# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.18.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.18.1/prism-v0.18.1-darwin-amd64"
      sha256 "430f10ee78108a1b79e7cbcbe8c78da209506d0ece1815a47fb1da0fce0868b1"

      define_method(:install) do
        bin.install "prism-v0.18.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.18.1/prism-v0.18.1-darwin-arm64"
      sha256 "9e9b73bf4e0bfe79bb8f35fca6957271d5851d95fc96ad47193fb0f5f2461323"

      define_method(:install) do
        bin.install "prism-v0.18.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.18.1/prism-v0.18.1-linux-amd64"
      sha256 "83c9037d417589642fa8994eca5942e7efef747fe29fc7c2de896422a3984124"
      define_method(:install) do
        bin.install "prism-v0.18.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.18.1/prism-v0.18.1-linux-arm64"
      sha256 "6618a10e4a41b4382eca6963f95366d6b9fa5234f4a7c64fe106122254fc292f"
      define_method(:install) do
        bin.install "prism-v0.18.1-linux-arm64" => "prism"
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
