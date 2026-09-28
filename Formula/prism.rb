# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.2/prism-v0.85.2-darwin-amd64"
      sha256 "4853827079051567b7a1fcfafac4dbb3741ac4be5d4bac56b2187662e22297e5"

      define_method(:install) do
        bin.install "prism-v0.85.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.2/prism-v0.85.2-darwin-arm64"
      sha256 "41fbce2153728d3b9586293ce9c5f28ab92da93178d725089d5c2b8a67b40ad3"

      define_method(:install) do
        bin.install "prism-v0.85.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.2/prism-v0.85.2-linux-amd64"
      sha256 "e89afd269eae5e139de6aff01cc4b2e0bfd1de9942e7f1932c2d45fa3dfdd26e"

      define_method(:install) do
        bin.install "prism-v0.85.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.2/prism-v0.85.2-linux-arm64"
      sha256 "20a85de152e5624c89681b0ace34a8c92a32706404335dd4c84c3d0496e09efb"

      define_method(:install) do
        bin.install "prism-v0.85.2-linux-arm64" => "prism"
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
