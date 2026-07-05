# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.18.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.18.0/prism-v0.18.0-darwin-amd64"
      sha256 "6ed6834f38be4c63ac7e20fff48d2b7a51c07d6021fac845b2fd5a5dc1182ea9"

      define_method(:install) do
        bin.install "prism-v0.18.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.18.0/prism-v0.18.0-darwin-arm64"
      sha256 "855995008ffbb19ed5508cdab19f2838cc968dc205ae08a03ec596a85d271b1a"

      define_method(:install) do
        bin.install "prism-v0.18.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.18.0/prism-v0.18.0-linux-amd64"
      sha256 "1e184c5ba6c9907d736f0ef3eedd6ad8a2bdb7d46119269aaab73c3be8117aa8"
      define_method(:install) do
        bin.install "prism-v0.18.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.18.0/prism-v0.18.0-linux-arm64"
      sha256 "7dfb9ba8941825e53034fbde734676ac0adfcb14afad4236fa636249d932ab53"
      define_method(:install) do
        bin.install "prism-v0.18.0-linux-arm64" => "prism"
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
