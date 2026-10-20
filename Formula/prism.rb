# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.34"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.34/prism-v0.87.34-darwin-amd64"
      sha256 "8b0cb8e4ab69014762a14e32499fb5a2e523d4ca2fb988e4ba27bdebdcc31b06"

      define_method(:install) do
        bin.install "prism-v0.87.34-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.34/prism-v0.87.34-darwin-arm64"
      sha256 "fdb017213c48ad652d30374dab6818503cec8f9a699e8ffe00bbc318fe3d0a44"

      define_method(:install) do
        bin.install "prism-v0.87.34-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.34/prism-v0.87.34-linux-amd64"
      sha256 "959b441c6a5e0b238c7935f4db9b1cbb619efd6d02a55a319f5e1dee5a353396"

      define_method(:install) do
        bin.install "prism-v0.87.34-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.34/prism-v0.87.34-linux-arm64"
      sha256 "d48de16ac35d5ea9947b983cf31db85bd71263e0e6737cf04971f7a8bd88a0be"

      define_method(:install) do
        bin.install "prism-v0.87.34-linux-arm64" => "prism"
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
