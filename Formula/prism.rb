# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.1/prism-v0.19.1-darwin-amd64"
      sha256 "78f15a43d86459edc0d2ce475383eb1280eda707f2107ad41fb7675e0dfdf3fe"

      define_method(:install) do
        bin.install "prism-v0.19.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.1/prism-v0.19.1-darwin-arm64"
      sha256 "e4116a1bcdb9d400f8c5518d8120588260a87a353e5534f69fc662a21dc206e6"

      define_method(:install) do
        bin.install "prism-v0.19.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.1/prism-v0.19.1-linux-amd64"
      sha256 "6e971ae0befee818fc721295bae2d516cf75ac00624e9119f53a28db2ead353e"
      define_method(:install) do
        bin.install "prism-v0.19.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.1/prism-v0.19.1-linux-arm64"
      sha256 "0cded2db2cce8e412a244a4dcd70cb952b0cbb5db6599cc87d18f09cf1671c07"
      define_method(:install) do
        bin.install "prism-v0.19.1-linux-arm64" => "prism"
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
