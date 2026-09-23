# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.81.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.81.0/prism-v0.81.0-darwin-amd64"
      sha256 "f319c7b5d81fd16dd6c4c73774c3500314f1d9472c4c6630d5ab3fc1526a0d19"

      define_method(:install) do
        bin.install "prism-v0.81.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.81.0/prism-v0.81.0-darwin-arm64"
      sha256 "546208d10a225b54c0869d75b29c61256c145f430288cb9af8aef3296cc7df16"

      define_method(:install) do
        bin.install "prism-v0.81.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.81.0/prism-v0.81.0-linux-amd64"
      sha256 "9cddf766a4cd1a41ba7c8b4a2e7876fbeffb92424a8b742e39a15254eba587ca"

      define_method(:install) do
        bin.install "prism-v0.81.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.81.0/prism-v0.81.0-linux-arm64"
      sha256 "2663ed42ccd6cbd4dd7b32c7be25065c8308c82d2b6b8f4ad333387d26d180de"

      define_method(:install) do
        bin.install "prism-v0.81.0-linux-arm64" => "prism"
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
