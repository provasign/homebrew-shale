# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.23.0/prism-v0.23.0-darwin-amd64"
      sha256 "67f84787ef8f4d18ad5e992e03f12b3636749c8644123fc28b89563ec1554510"

      define_method(:install) do
        bin.install "prism-v0.23.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.23.0/prism-v0.23.0-darwin-arm64"
      sha256 "31495ef45595c3850dca427d8259d9219016f202301dd8776b854d4de5229ad7"

      define_method(:install) do
        bin.install "prism-v0.23.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.23.0/prism-v0.23.0-linux-amd64"
      sha256 "0ab30199fb9e180b5c933c87b86e639750b7de5dcbab0bb399a0746af046927b"
      define_method(:install) do
        bin.install "prism-v0.23.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.23.0/prism-v0.23.0-linux-arm64"
      sha256 "27753dd0c77a9fb6a7fbc1c2b0612c5db76b9f0112ac3f8711a87934e5f71ad2"
      define_method(:install) do
        bin.install "prism-v0.23.0-linux-arm64" => "prism"
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
