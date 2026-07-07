# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.20.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.20.1/prism-v0.20.1-darwin-amd64"
      sha256 "914c568e51feeab631c6bd5fb0047e79f43918815889b1f6913597d91af264e7"

      define_method(:install) do
        bin.install "prism-v0.20.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.20.1/prism-v0.20.1-darwin-arm64"
      sha256 "1f6220ea82c49db62ddf77b6043b7f3a56675cb26f2e414f00b2bfdd6436e488"

      define_method(:install) do
        bin.install "prism-v0.20.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.20.1/prism-v0.20.1-linux-amd64"
      sha256 "e1bcb2fec7d2578e35a3eceb58346636d7e235dbc20f39e8a251600d1590cb28"
      define_method(:install) do
        bin.install "prism-v0.20.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.20.1/prism-v0.20.1-linux-arm64"
      sha256 "b039f093eddce91db43e17c0d868ec28621cd13e48d29dd17369f4bc170f6d1b"
      define_method(:install) do
        bin.install "prism-v0.20.1-linux-arm64" => "prism"
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
