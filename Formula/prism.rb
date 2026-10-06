# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.3/prism-v0.86.3-darwin-amd64"
      sha256 "db241c053cc42575f37a69b6757abe41ef5aca2cfa5e026931ed8791aec242d2"

      define_method(:install) do
        bin.install "prism-v0.86.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.3/prism-v0.86.3-darwin-arm64"
      sha256 "b71c28ef44f230187a503d50a1664081cff92f3d1ca9c64805ba75fffae06648"

      define_method(:install) do
        bin.install "prism-v0.86.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.3/prism-v0.86.3-linux-amd64"
      sha256 "69b2be380ed79e65f14ab47d7754643c5e1bc64dc523417d0c9e502265c37069"

      define_method(:install) do
        bin.install "prism-v0.86.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.3/prism-v0.86.3-linux-arm64"
      sha256 "118c26d2fe50443fe244475a91735c113b95e8995e46f70ba0a3ffe27127dd3d"

      define_method(:install) do
        bin.install "prism-v0.86.3-linux-arm64" => "prism"
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
