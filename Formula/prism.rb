# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.73.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.73.0/prism-v0.73.0-darwin-amd64"
      sha256 "1da41da04b5aa5c7143b27ea234db07e45708991ca5e0292cee2a9c8c66e43e3"

      define_method(:install) do
        bin.install "prism-v0.73.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.73.0/prism-v0.73.0-darwin-arm64"
      sha256 "9a574d8f721f03d16bedeef13ffcf92c3255e1951971bd9d034741a9d7417c0c"

      define_method(:install) do
        bin.install "prism-v0.73.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.73.0/prism-v0.73.0-linux-amd64"
      sha256 "ef4b8a70d10062132934ea51c2d5e9fcec2bb4067ede087b892592932302b729"

      define_method(:install) do
        bin.install "prism-v0.73.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.73.0/prism-v0.73.0-linux-arm64"
      sha256 "43325293037c59c131eba4aa2855c2ea9641f992122fb59b826460419317a96f"

      define_method(:install) do
        bin.install "prism-v0.73.0-linux-arm64" => "prism"
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
