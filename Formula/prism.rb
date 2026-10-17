# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.29"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.29/prism-v0.87.29-darwin-amd64"
      sha256 "b8fbb7ecac6dd597c6be9e2e3a415ad59c2359b8c031baf7c1a83492f527d231"

      define_method(:install) do
        bin.install "prism-v0.87.29-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.29/prism-v0.87.29-darwin-arm64"
      sha256 "aea097269adf5cfcb95502a78e8a954091c4caa0c263ae5c6a3b2ef2ed08b39f"

      define_method(:install) do
        bin.install "prism-v0.87.29-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.29/prism-v0.87.29-linux-amd64"
      sha256 "09774b5581f1a31b429eabc7dc1bd86329919ba539fcb890f6f5df6595c28132"

      define_method(:install) do
        bin.install "prism-v0.87.29-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.29/prism-v0.87.29-linux-arm64"
      sha256 "1b277f280fa84754cddf1dbb39887753a0dd1144ffaff4e9e691a64a81fc7beb"

      define_method(:install) do
        bin.install "prism-v0.87.29-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Run `prism init` inside each project after installing or upgrading to
      configure supported AI clients. Prism setup is project-scoped;
      `prism init --global` is no longer supported.

      Restart or reload running AI clients after upgrading Prism.

      Prism reports other installed copies when their versions differ.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
