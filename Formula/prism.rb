# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.17/prism-v0.87.17-darwin-amd64"
      sha256 "448db4434197f0d3fd897d28235c22511ca925434772cb72733b2b55860596ee"

      define_method(:install) do
        bin.install "prism-v0.87.17-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.17/prism-v0.87.17-darwin-arm64"
      sha256 "71716bdd31c887c4a29cdb2c744370043e3edae31b4fa476adf8356c55099b2c"

      define_method(:install) do
        bin.install "prism-v0.87.17-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.17/prism-v0.87.17-linux-amd64"
      sha256 "7d862c530c8d21bfd9df4bb9afa5102b371a26160324d012b5ce048d79f6dcd7"

      define_method(:install) do
        bin.install "prism-v0.87.17-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.17/prism-v0.87.17-linux-arm64"
      sha256 "18fd87da04b69315a1fafd02a2b1c4c6e5fb100782dfdb3a8563c7aa31c71f44"

      define_method(:install) do
        bin.install "prism-v0.87.17-linux-arm64" => "prism"
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
