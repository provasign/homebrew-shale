# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.31"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.31/prism-v0.87.31-darwin-amd64"
      sha256 "6a314e53d317250784e02b8be4d6ae2d66c9791c4a41ae4ca2cee18e3728d62e"

      define_method(:install) do
        bin.install "prism-v0.87.31-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.31/prism-v0.87.31-darwin-arm64"
      sha256 "28a3ce15a51338155ef347e73ab5e6ac738e816bf44e58a074875cd8a34ef88a"

      define_method(:install) do
        bin.install "prism-v0.87.31-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.31/prism-v0.87.31-linux-amd64"
      sha256 "22ca4f3ff4365f1bdae23e67267ad4561592b0e5a887675041a8d17bae7f3787"

      define_method(:install) do
        bin.install "prism-v0.87.31-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.31/prism-v0.87.31-linux-arm64"
      sha256 "e54c33b2bdf95a4dbc216e1b631680eef874f44e052efacab68446155968d339"

      define_method(:install) do
        bin.install "prism-v0.87.31-linux-arm64" => "prism"
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
