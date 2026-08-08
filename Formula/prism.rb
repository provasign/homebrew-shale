# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.38.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.38.0/prism-v0.38.0-darwin-amd64"
      sha256 "80de4b3364178861ed6b842577819ffbc406ce9f653bcd37b49bd6f0de1d2ea7"

      define_method(:install) do
        bin.install "prism-v0.38.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.38.0/prism-v0.38.0-darwin-arm64"
      sha256 "a9803349cea3a4329bfeda9340cf57eafc746b7732a399fc8e4c15b17936abc1"

      define_method(:install) do
        bin.install "prism-v0.38.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.38.0/prism-v0.38.0-linux-amd64"
      sha256 "33bc0241467daf77f165912f050dfb69c6c017b4b6e286e9ec6024dbae176e50"

      define_method(:install) do
        bin.install "prism-v0.38.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.38.0/prism-v0.38.0-linux-arm64"
      sha256 "ea25d2a63ced4509b93bf34b42abb08d7c6fc0356dcdb981dcad622d8551ef91"

      define_method(:install) do
        bin.install "prism-v0.38.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
