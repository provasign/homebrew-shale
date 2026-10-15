# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.26"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.26/prism-v0.87.26-darwin-amd64"
      sha256 "0fb811d8598036e1b052493632ed444ec34184c82f3cc311efb87d0209db9a8a"

      define_method(:install) do
        bin.install "prism-v0.87.26-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.26/prism-v0.87.26-darwin-arm64"
      sha256 "88c1e1b26262c506272f3c16b0245b4ce3902441c8cddb6664e2bea2a70a76c1"

      define_method(:install) do
        bin.install "prism-v0.87.26-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.26/prism-v0.87.26-linux-amd64"
      sha256 "89fc14ad0fccddb87b32db541731b9c606b79e1dba5444819a1808af5e1ba8ef"

      define_method(:install) do
        bin.install "prism-v0.87.26-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.26/prism-v0.87.26-linux-arm64"
      sha256 "597b74dc131b5eeb716e35219617851619b3dc501531b625c16617c48c8f3e2e"

      define_method(:install) do
        bin.install "prism-v0.87.26-linux-arm64" => "prism"
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
