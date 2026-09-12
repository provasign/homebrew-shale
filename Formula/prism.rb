# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.74.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.74.1/prism-v0.74.1-darwin-amd64"
      sha256 "ec44cf1d3926071bdf3f00813e9766a48cd3b7c26a7e0283b80a50ae4ac913fe"

      define_method(:install) do
        bin.install "prism-v0.74.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.74.1/prism-v0.74.1-darwin-arm64"
      sha256 "eea4ee42dd2fb286c40dfa43b71ef4539118569429a590b25d70e9e7a9cf15e7"

      define_method(:install) do
        bin.install "prism-v0.74.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.74.1/prism-v0.74.1-linux-amd64"
      sha256 "866693e7425386e017cb00efe83ece82ab17e842cb82a9345cdf08c5bdb5bcb2"

      define_method(:install) do
        bin.install "prism-v0.74.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.74.1/prism-v0.74.1-linux-arm64"
      sha256 "050a164dbbf3328778ea9c52bc0152b55f0f949f0938b7df94da0a88c1de114d"

      define_method(:install) do
        bin.install "prism-v0.74.1-linux-arm64" => "prism"
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
