# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.21.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.21.2/prism-v0.21.2-darwin-amd64"
      sha256 "ecd54e3c5e03572d931e84550c026230926809763d150ec0f4612df2becebab4"

      define_method(:install) do
        bin.install "prism-v0.21.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.21.2/prism-v0.21.2-darwin-arm64"
      sha256 "7e6a89317c2eb9914d410f591500e6c82ab89a629883ba05263ba76e02c28eb1"

      define_method(:install) do
        bin.install "prism-v0.21.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.21.2/prism-v0.21.2-linux-amd64"
      sha256 "079e08e113342b4c8a37a372150889a87b4bd45cae8eeabf30ada04d987bb2fd"
      define_method(:install) do
        bin.install "prism-v0.21.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.21.2/prism-v0.21.2-linux-arm64"
      sha256 "205eb056eebaec69d46e0be8a1e69e7d8966527a0abc9819e02d24379453f21f"
      define_method(:install) do
        bin.install "prism-v0.21.2-linux-arm64" => "prism"
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
