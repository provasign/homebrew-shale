# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.20.0/prism-v0.20.0-darwin-amd64"
      sha256 "5a66a42a380e0d15e76ed41485a38ef8c77906e7ee32e06bca2c72ec51c0d0b4"

      define_method(:install) do
        bin.install "prism-v0.20.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.20.0/prism-v0.20.0-darwin-arm64"
      sha256 "604dd258139182f88db773d2856a4486f6dfe94da6679c4a8b7e852854c80ed6"

      define_method(:install) do
        bin.install "prism-v0.20.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.20.0/prism-v0.20.0-linux-amd64"
      sha256 "1c52506b5d67ad49dace6f6e4a827f4ac0df9605220fd5a627ace717bb81e486"
      define_method(:install) do
        bin.install "prism-v0.20.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.20.0/prism-v0.20.0-linux-arm64"
      sha256 "1ba2c25d116101a8a2aa7186419a77e930a162e98fcef8e4ca1c1354dc1a4631"
      define_method(:install) do
        bin.install "prism-v0.20.0-linux-arm64" => "prism"
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
