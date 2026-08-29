# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.4/prism-v0.56.4-darwin-amd64"
      sha256 "c5e9374cace5bbb385dd3dc1521c211e9441a1c17e51850c4629d5da90084489"

      define_method(:install) do
        bin.install "prism-v0.56.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.4/prism-v0.56.4-darwin-arm64"
      sha256 "ad2102bc54771b8dab2968afda0112d490d9fca61657ec5ecbbfefc8dc15be61"

      define_method(:install) do
        bin.install "prism-v0.56.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.4/prism-v0.56.4-linux-amd64"
      sha256 "3029950e952eddc3b779b762202cbdd7f4ed7b024d2f0d23fe565425de6721a8"

      define_method(:install) do
        bin.install "prism-v0.56.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.4/prism-v0.56.4-linux-arm64"
      sha256 "dd86430fa62f77c0143e0a211af6fbfc307edc2a09a60cb87d26e2bb36a8bd63"

      define_method(:install) do
        bin.install "prism-v0.56.4-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
