# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.80.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.80.1/prism-v0.80.1-darwin-amd64"
      sha256 "921199e9e6909375ade4bd3eea6639a48ffbd3aa09d8704aead6e04909c5f1cc"

      define_method(:install) do
        bin.install "prism-v0.80.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.80.1/prism-v0.80.1-darwin-arm64"
      sha256 "0dd285d95020418c846762b4d9b9a5301a2b6bbff89ae0fa048ccbebb29c4ab8"

      define_method(:install) do
        bin.install "prism-v0.80.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.80.1/prism-v0.80.1-linux-amd64"
      sha256 "72d0f7e07ba7c72415d4ed87d3f9cb213ad6e76735105a11c9ca5182d460c141"

      define_method(:install) do
        bin.install "prism-v0.80.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.80.1/prism-v0.80.1-linux-arm64"
      sha256 "524e8b11af306805f6a21c363abea8f0d42e19977ef12aaf3eaeb13709f5b94c"

      define_method(:install) do
        bin.install "prism-v0.80.1-linux-arm64" => "prism"
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
