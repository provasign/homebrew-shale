# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.2/prism-v0.55.2-darwin-amd64"
      sha256 "94cd00386594cbda30c1d3890f18a14e658db8f399bc8f6fcc8e92f639db83df"

      define_method(:install) do
        bin.install "prism-v0.55.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.2/prism-v0.55.2-darwin-arm64"
      sha256 "fccfabf39ac6e63cd762bda344e054ce7fa6075bcc4a296fb74cca00774265fe"

      define_method(:install) do
        bin.install "prism-v0.55.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.2/prism-v0.55.2-linux-amd64"
      sha256 "17b16b4c64773210985efb17e2f0fc78b475c59f9e4f61944f14d4d5460a54b9"

      define_method(:install) do
        bin.install "prism-v0.55.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.2/prism-v0.55.2-linux-arm64"
      sha256 "c83fced225fbb67fa8153150239d0f7dbadb1f05f0f4a90e4f05d8fdbde2d846"

      define_method(:install) do
        bin.install "prism-v0.55.2-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
