# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.74.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.74.0/prism-v0.74.0-darwin-amd64"
      sha256 "876c21701c58ef41d8720b18b177ebd50999ee54658e611b210b5314dcc91c3f"

      define_method(:install) do
        bin.install "prism-v0.74.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.74.0/prism-v0.74.0-darwin-arm64"
      sha256 "7d193b3a1ea70f1b3ad2903da133f68f4ffd74f7dcbba3943cae558d95e91bce"

      define_method(:install) do
        bin.install "prism-v0.74.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.74.0/prism-v0.74.0-linux-amd64"
      sha256 "24a1332c5d5d9c58f5f9d9a08537e1654666e1c1f6d22046b9085ea3081d0fdd"

      define_method(:install) do
        bin.install "prism-v0.74.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.74.0/prism-v0.74.0-linux-arm64"
      sha256 "3cecd2ddc0ec225962ddb63cdfdaa4d9a252025a28ffc404681ec46e0ef12f07"

      define_method(:install) do
        bin.install "prism-v0.74.0-linux-arm64" => "prism"
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
