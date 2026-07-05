# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.17.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.17.1/prism-v0.17.1-darwin-amd64"
      sha256 "644afb91c9101635ba782bf38e2a1f15ff8f73b47b1416c8f9af3ebd8214adc5"

      define_method(:install) do
        bin.install "prism-v0.17.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.17.1/prism-v0.17.1-darwin-arm64"
      sha256 "a31725a41a3c78123a605a52913ea3e7c26de597b655458c431061890d8adf7d"

      define_method(:install) do
        bin.install "prism-v0.17.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.17.1/prism-v0.17.1-linux-amd64"
      sha256 "37f933bbd8eaf84734397b1019ac35848b3be476455294688bc0ed4b52d77b00"
      define_method(:install) do
        bin.install "prism-v0.17.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.17.1/prism-v0.17.1-linux-arm64"
      sha256 "ef5a412ad04fd72474f9449f0121525bcf3dc759b8e537a0132b25b4b5bcdb4c"
      define_method(:install) do
        bin.install "prism-v0.17.1-linux-arm64" => "prism"
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
