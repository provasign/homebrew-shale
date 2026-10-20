# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.37"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.37/prism-v0.87.37-darwin-amd64"
      sha256 "1f85a1a12979e36d296f399ee3a0ba79a285ab05ef8b8f88bb22b64132339921"

      define_method(:install) do
        bin.install "prism-v0.87.37-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.37/prism-v0.87.37-darwin-arm64"
      sha256 "cc4084ae012ae3d7e1730784016defad752ba925e582967d3c9ff1b47c33a288"

      define_method(:install) do
        bin.install "prism-v0.87.37-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.37/prism-v0.87.37-linux-amd64"
      sha256 "6654c4db88e0c2324e9c900cd489cbb8b6ae1119f138cd06a1f75836e4234c00"

      define_method(:install) do
        bin.install "prism-v0.87.37-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.37/prism-v0.87.37-linux-arm64"
      sha256 "9b4e66971c92ac25e5c8b8b0001a1734a82146a87cbe07106de4eeb64cc8b606"

      define_method(:install) do
        bin.install "prism-v0.87.37-linux-arm64" => "prism"
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
