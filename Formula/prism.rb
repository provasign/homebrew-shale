# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.16.0/prism-v0.16.0-darwin-amd64"
      sha256 "aea3f7332dacb751e547b1ddcd73129ccf9a82ca226443c7bd4524e462b4dd6a"

      define_method(:install) do
        bin.install "prism-v0.16.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.16.0/prism-v0.16.0-darwin-arm64"
      sha256 "434891d5b1d64cb3f94c7d45d0355ab4da9eb88e787704144a5090d7236e4bdf"

      define_method(:install) do
        bin.install "prism-v0.16.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.16.0/prism-v0.16.0-linux-amd64"
      sha256 "2430fb6b6fcb75b0078fb8e387dce3ab43bd9543b7de8534f18bd1e961e51e61"
      define_method(:install) do
        bin.install "prism-v0.16.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.16.0/prism-v0.16.0-linux-arm64"
      sha256 "0e70b89229bcc3644ac39badd310a28af9f6abbf931c5fd9d0390a6c0b763922"
      define_method(:install) do
        bin.install "prism-v0.16.0-linux-arm64" => "prism"
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
