# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.83.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.83.1/prism-v0.83.1-darwin-amd64"
      sha256 "d37b14496f62e4dda4120e3751a7424bcc6ac93218b8d254b26b449ae52f2d09"

      define_method(:install) do
        bin.install "prism-v0.83.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.83.1/prism-v0.83.1-darwin-arm64"
      sha256 "4d9495533610b2afaca0f35150f03a2dc1e283d0a2ffe463181e591d52b3e7fb"

      define_method(:install) do
        bin.install "prism-v0.83.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.83.1/prism-v0.83.1-linux-amd64"
      sha256 "136043dc0f5e9b1af62dc895406ee0aed9d9ec50c843220a3b466996652f9601"

      define_method(:install) do
        bin.install "prism-v0.83.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.83.1/prism-v0.83.1-linux-arm64"
      sha256 "3bc92235c62fbcd00f31106badf08e00b44f9f86f4a31f8364ba2660d8c1a6c8"

      define_method(:install) do
        bin.install "prism-v0.83.1-linux-arm64" => "prism"
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
