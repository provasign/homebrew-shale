# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.2/prism-v0.86.2-darwin-amd64"
      sha256 "41dc23e2b4517c91d3eadbf1d5826b1ce74ef61143eb492c1c7e471bc4943da1"

      define_method(:install) do
        bin.install "prism-v0.86.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.2/prism-v0.86.2-darwin-arm64"
      sha256 "f94b00ae5d2f9d0cf7941262397bbff4b1fb92a0fdc708046a4f141caaafdef6"

      define_method(:install) do
        bin.install "prism-v0.86.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.2/prism-v0.86.2-linux-amd64"
      sha256 "1e00b0830606634210c0ed4d91799c685027102772335ad55f054ad1b74e0c42"

      define_method(:install) do
        bin.install "prism-v0.86.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.2/prism-v0.86.2-linux-arm64"
      sha256 "e5e2ab471c60f87c6de3549c36d76fb5750f9668be6202d6cb3cf988ef874839"

      define_method(:install) do
        bin.install "prism-v0.86.2-linux-arm64" => "prism"
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
