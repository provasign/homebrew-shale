# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.1/prism-v0.86.1-darwin-amd64"
      sha256 "0280a91ec5600df3cb033c6a0e5170a518ff11b867d87a1b4df40c171569d54e"

      define_method(:install) do
        bin.install "prism-v0.86.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.1/prism-v0.86.1-darwin-arm64"
      sha256 "e3af3914c9e9d9a3ec015b2e52f5089b4a962d3fc105b07c49a6b188ba3e0bc7"

      define_method(:install) do
        bin.install "prism-v0.86.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.1/prism-v0.86.1-linux-amd64"
      sha256 "8169d6180cdece580a180311c73f2bb53562f6516d46702a9695e025329f8f51"

      define_method(:install) do
        bin.install "prism-v0.86.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.1/prism-v0.86.1-linux-arm64"
      sha256 "2643ff0307dd42569830405a7a3744f315a265d5e68b9605239040f37ec37d57"

      define_method(:install) do
        bin.install "prism-v0.86.1-linux-arm64" => "prism"
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
