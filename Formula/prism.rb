# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.8.0/prism-v0.8.0-darwin-amd64"
      sha256 "eca80e6fbf8a6ad3e659d93080eeef9c546e6099968d80f35bfd5767b34718ad"

      define_method(:install) do
        bin.install "prism-v0.8.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.8.0/prism-v0.8.0-darwin-arm64"
      sha256 "9db00a7edd6f077844908762f4ef68917336bdd37f09113780b1e144ee442d97"

      define_method(:install) do
        bin.install "prism-v0.8.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.8.0/prism-v0.8.0-linux-amd64"
      sha256 "00bc6ec0bd9bce2c50f1df0e57098c64e7da4db74b3f5d84dd1e593624482ced"
      define_method(:install) do
        bin.install "prism-v0.8.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.8.0/prism-v0.8.0-linux-arm64"
      sha256 "91d52af95e6785105e3804986657fa7fafe96460378a1b02bc620328ec6ca326"
      define_method(:install) do
        bin.install "prism-v0.8.0-linux-arm64" => "prism"
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
