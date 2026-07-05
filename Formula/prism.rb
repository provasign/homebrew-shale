# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.3/prism-v0.19.3-darwin-amd64"
      sha256 "358b7075d80d4de73734bb5d8b524458e2b349494570fe86a1fbb4455a774812"

      define_method(:install) do
        bin.install "prism-v0.19.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.3/prism-v0.19.3-darwin-arm64"
      sha256 "bad8247c138028a65b0d56c7650bed095f231e1272b8645084903e3abfcb8fdb"

      define_method(:install) do
        bin.install "prism-v0.19.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.3/prism-v0.19.3-linux-amd64"
      sha256 "fbaf51dd6ad813791a6365f3bf9148bab164f56305d0a9b69a64ad7bb012280d"
      define_method(:install) do
        bin.install "prism-v0.19.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.3/prism-v0.19.3-linux-arm64"
      sha256 "3913553e1990707ecfe4fdd91c27d4a2fe59b3859c31e3290c85096cd21ad075"
      define_method(:install) do
        bin.install "prism-v0.19.3-linux-arm64" => "prism"
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
