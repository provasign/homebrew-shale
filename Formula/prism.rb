# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.2/prism-v0.19.2-darwin-amd64"
      sha256 "1be3342bca184f1ebf6a47a0dd08418f5f721f7001c83099d722800e8007e183"

      define_method(:install) do
        bin.install "prism-v0.19.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.2/prism-v0.19.2-darwin-arm64"
      sha256 "a7574d364ce0dd60f95274ae341ca1ff222015777761bee5d2c55002f856696c"

      define_method(:install) do
        bin.install "prism-v0.19.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.2/prism-v0.19.2-linux-amd64"
      sha256 "b64ef7d96fc9500c96cc868b9b00909317afad80dc15761f699f659e4ea8007e"
      define_method(:install) do
        bin.install "prism-v0.19.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.2/prism-v0.19.2-linux-arm64"
      sha256 "ee0154ae005cd9669bc6b89d1ded36d1a2ee93b1a65f6893c0642b668bd75155"
      define_method(:install) do
        bin.install "prism-v0.19.2-linux-arm64" => "prism"
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
