# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.1/prism-v0.85.1-darwin-amd64"
      sha256 "fd8fe9effe1d83d4245ae04b18a072fc0673625d78d6bfd4260e013ccff7896e"

      define_method(:install) do
        bin.install "prism-v0.85.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.1/prism-v0.85.1-darwin-arm64"
      sha256 "f09d3ca5dcf8810bb44b568910bb8bb9e8418d7336a4ccbd43176c48498c1d68"

      define_method(:install) do
        bin.install "prism-v0.85.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.1/prism-v0.85.1-linux-amd64"
      sha256 "830710fdb24334142bdafead3d0ed29434eb871f0f4d52247ac09022a045a096"

      define_method(:install) do
        bin.install "prism-v0.85.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.1/prism-v0.85.1-linux-arm64"
      sha256 "b6eb78c13efaa90e89ec2a609f99dfd1aca7c63150c8bede1e4e2800c22a46d0"

      define_method(:install) do
        bin.install "prism-v0.85.1-linux-arm64" => "prism"
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
