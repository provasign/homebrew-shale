# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.75.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.75.1/prism-v0.75.1-darwin-amd64"
      sha256 "bbce12fda9e48fb3b1fa4afdb6fd3307a5ec18dfeafef3ec6f8c3d75c5a1ed0b"

      define_method(:install) do
        bin.install "prism-v0.75.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.75.1/prism-v0.75.1-darwin-arm64"
      sha256 "9fdadcfb5b9e78d3d07e39aef2b8f15e78eff7fdc062325e9f5e4dd5469bd870"

      define_method(:install) do
        bin.install "prism-v0.75.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.75.1/prism-v0.75.1-linux-amd64"
      sha256 "bf8738dd967276bb6a03d76413007b8af476c3bac49986a2f76def6eb342f4a1"

      define_method(:install) do
        bin.install "prism-v0.75.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.75.1/prism-v0.75.1-linux-arm64"
      sha256 "0df5cfb2a0581f1dd6b80fc901e46d6b117308f464038b8c39812d2c99017d5e"

      define_method(:install) do
        bin.install "prism-v0.75.1-linux-arm64" => "prism"
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
