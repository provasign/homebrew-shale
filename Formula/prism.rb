# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.36"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.36/prism-v0.87.36-darwin-amd64"
      sha256 "fd27af0232b58d4bec534a96debb6e7329c9bdff79c485136c27fecaa7e2b276"

      define_method(:install) do
        bin.install "prism-v0.87.36-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.36/prism-v0.87.36-darwin-arm64"
      sha256 "d8309491a6b70dfcbc080abf1c9a46142ba142dcd87f2aba1264b7d7504a3df2"

      define_method(:install) do
        bin.install "prism-v0.87.36-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.36/prism-v0.87.36-linux-amd64"
      sha256 "ca30766ed119a243887274b869fb4be4e112adf3fe0a41be59cc9ac25f428fb0"

      define_method(:install) do
        bin.install "prism-v0.87.36-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.36/prism-v0.87.36-linux-arm64"
      sha256 "164b015762cc67afcd8f1d1e78cf5fc2c2194d240648ee72496802ae229b260d"

      define_method(:install) do
        bin.install "prism-v0.87.36-linux-arm64" => "prism"
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
