# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.1/prism-v0.87.1-darwin-amd64"
      sha256 "568b2a96b0226f54ebd4b76a3077ce4a8b6d93ea8fcaca70f0798a55a67c9f44"

      define_method(:install) do
        bin.install "prism-v0.87.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.1/prism-v0.87.1-darwin-arm64"
      sha256 "6dba8f574b766f408ea9ebefe1a255215209cb72ce5930c3e396aff03324ec11"

      define_method(:install) do
        bin.install "prism-v0.87.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.1/prism-v0.87.1-linux-amd64"
      sha256 "b17e18fed5f6a7652dae2a70319098c067bc4c83c79195b5264bbf81be59dc46"

      define_method(:install) do
        bin.install "prism-v0.87.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.1/prism-v0.87.1-linux-arm64"
      sha256 "27ae9202e5292eae10a9e39d952e7a1a0448f16eb647ba363ce71d72d624b9d9"

      define_method(:install) do
        bin.install "prism-v0.87.1-linux-arm64" => "prism"
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
