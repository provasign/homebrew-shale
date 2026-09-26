# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.83.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.83.2/prism-v0.83.2-darwin-amd64"
      sha256 "906a27287c3948c1c416ec989375681c8a9ebe1e3b8271dd3e5aca501b6dab35"

      define_method(:install) do
        bin.install "prism-v0.83.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.83.2/prism-v0.83.2-darwin-arm64"
      sha256 "71ce9aa4a11cabed74cb1d91c0d4fbc35abbf2ccd1d235c6338d0bc62dd85056"

      define_method(:install) do
        bin.install "prism-v0.83.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.83.2/prism-v0.83.2-linux-amd64"
      sha256 "7dc478b5b73c33f8df8a02da55e4efd00ad1d4238bd69ce279eabaf92678e38a"

      define_method(:install) do
        bin.install "prism-v0.83.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.83.2/prism-v0.83.2-linux-arm64"
      sha256 "bc3c75c64fdf93394fad4a4e27b564318bcdeeacb9ac33ba3c441172afb8a6eb"

      define_method(:install) do
        bin.install "prism-v0.83.2-linux-arm64" => "prism"
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
