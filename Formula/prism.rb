# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.84.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.84.0/prism-v0.84.0-darwin-amd64"
      sha256 "c04a41ca1ed23e7d8489d4b983fea9f59f68ef71579e9ab0aa9e67c2bb4eafb9"

      define_method(:install) do
        bin.install "prism-v0.84.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.84.0/prism-v0.84.0-darwin-arm64"
      sha256 "6138077bd7bc4cc734c255329de826fa62adba40e00966d15d190933029368f8"

      define_method(:install) do
        bin.install "prism-v0.84.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.0/prism-v0.84.0-linux-amd64"
      sha256 "baea6f91334f8c12453b5ff32b64f2534d6079bd765606e4d9283e43ee63babe"

      define_method(:install) do
        bin.install "prism-v0.84.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.0/prism-v0.84.0-linux-arm64"
      sha256 "72cbe71a9bdec7130555dfc8f62a9892a85b49f10453de5ff7767cb84547abc8"

      define_method(:install) do
        bin.install "prism-v0.84.0-linux-arm64" => "prism"
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
