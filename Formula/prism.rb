# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.21/prism-v0.87.21-darwin-amd64"
      sha256 "0ad1f1165f51dadcd8808a6e9f22b077a0d5d151f48209511b986f61e481858b"

      define_method(:install) do
        bin.install "prism-v0.87.21-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.21/prism-v0.87.21-darwin-arm64"
      sha256 "5e8f5e53e097387b6cd5b003ea9a0793dd5e69b821f4ec9767e5eb9554ced56b"

      define_method(:install) do
        bin.install "prism-v0.87.21-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.21/prism-v0.87.21-linux-amd64"
      sha256 "862003ec9c40215f8e44494e56570158e7feda0f2726b153d35aa8b8479b8070"

      define_method(:install) do
        bin.install "prism-v0.87.21-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.21/prism-v0.87.21-linux-arm64"
      sha256 "cced7f8f878d00f8690f2900f949259eea1a04ce19482367bfec67c853145ad5"

      define_method(:install) do
        bin.install "prism-v0.87.21-linux-arm64" => "prism"
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
