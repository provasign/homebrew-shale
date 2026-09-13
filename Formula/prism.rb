# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.76.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.76.0/prism-v0.76.0-darwin-amd64"
      sha256 "850478274cebe424849a9054187270e44cc332e8bad9a68644d66fa18c4c16d6"

      define_method(:install) do
        bin.install "prism-v0.76.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.76.0/prism-v0.76.0-darwin-arm64"
      sha256 "d6eaffbb7e75406b975ca8678e3a80d3d3f9c0e1ae0ccc3ba2b8c9465ce56616"

      define_method(:install) do
        bin.install "prism-v0.76.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.76.0/prism-v0.76.0-linux-amd64"
      sha256 "611560b1d2a27f6a7f226f9cf66e53a797c84d9393841744527397e31201a6c9"

      define_method(:install) do
        bin.install "prism-v0.76.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.76.0/prism-v0.76.0-linux-arm64"
      sha256 "84563443e6c6a19b5e4e4625be4e70d63a4346134d65c4803ed332c9c4a1b473"

      define_method(:install) do
        bin.install "prism-v0.76.0-linux-arm64" => "prism"
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
