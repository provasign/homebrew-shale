# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.10/prism-v0.85.10-darwin-amd64"
      sha256 "ac22b4ca0577d7b6c42591ad67ac859ff895e1192687b394f98ead335da0676e"

      define_method(:install) do
        bin.install "prism-v0.85.10-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.10/prism-v0.85.10-darwin-arm64"
      sha256 "901dce41b8e9c6786f2552773348450393d91d72570a574b2a8274a9f8e5d91b"

      define_method(:install) do
        bin.install "prism-v0.85.10-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.10/prism-v0.85.10-linux-amd64"
      sha256 "576d97c64137b74e95ccf4a0988fa664fff427c46d316cedcc05fac616f335ff"

      define_method(:install) do
        bin.install "prism-v0.85.10-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.10/prism-v0.85.10-linux-arm64"
      sha256 "0bc0d886637dc0effb1c26bc26d38fe4d21a90e1ecef925b2cb61069691c04d5"

      define_method(:install) do
        bin.install "prism-v0.85.10-linux-arm64" => "prism"
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
