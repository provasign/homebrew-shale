# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.2/prism-v0.87.2-darwin-amd64"
      sha256 "bd8a113d1b9645eb9445dfee8cee9277840092672b2b3b55d1c0bdf29c3bf1a8"

      define_method(:install) do
        bin.install "prism-v0.87.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.2/prism-v0.87.2-darwin-arm64"
      sha256 "ef3dbb832f940efee0196a5b6b94079a1549f583a59ef69a30c0a7465b46a4e5"

      define_method(:install) do
        bin.install "prism-v0.87.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.2/prism-v0.87.2-linux-amd64"
      sha256 "34fd5daa9bf293b4cae7f3d4bfb9fa1ca7a860468885358a2eacd6807c577d50"

      define_method(:install) do
        bin.install "prism-v0.87.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.2/prism-v0.87.2-linux-arm64"
      sha256 "794e6758138a17e2cab15f6ba7741952de2e8623694677e319ea352d9c5009fe"

      define_method(:install) do
        bin.install "prism-v0.87.2-linux-arm64" => "prism"
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
