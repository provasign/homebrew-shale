# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.13/prism-v0.87.13-darwin-amd64"
      sha256 "80fde16f377df76b506692f126fc5e4d811342e6b787a3a486ec7c5dd31569ad"

      define_method(:install) do
        bin.install "prism-v0.87.13-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.13/prism-v0.87.13-darwin-arm64"
      sha256 "a177fd52885653adffacb4f3f1e52dd17ed12020c133be9dc7018a47e34c0890"

      define_method(:install) do
        bin.install "prism-v0.87.13-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.13/prism-v0.87.13-linux-amd64"
      sha256 "88de53fc657e88e774fdf6a93ed96d54308d12699cdf51b64d57c2d0e127d78f"

      define_method(:install) do
        bin.install "prism-v0.87.13-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.13/prism-v0.87.13-linux-arm64"
      sha256 "b8d2ecd17626f72b67fc5fce3969e2b74cf398321b11719606e8673a8e409696"

      define_method(:install) do
        bin.install "prism-v0.87.13-linux-arm64" => "prism"
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
