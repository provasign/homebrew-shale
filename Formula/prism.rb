# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.5/prism-v0.87.5-darwin-amd64"
      sha256 "b53f226315ef3ca6255c47254bc0c06e3a64a54498161334c18db3d6fdf20040"

      define_method(:install) do
        bin.install "prism-v0.87.5-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.5/prism-v0.87.5-darwin-arm64"
      sha256 "8a8751de9a0cdc8009c89f8dbfe927b131f80ceee6e92b8fe9f4609d6c8336d0"

      define_method(:install) do
        bin.install "prism-v0.87.5-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.5/prism-v0.87.5-linux-amd64"
      sha256 "584cdb420239e25ddb22d1a8a0aedc0b199265aa7758b6baf9dc9d63df9f54e0"

      define_method(:install) do
        bin.install "prism-v0.87.5-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.5/prism-v0.87.5-linux-arm64"
      sha256 "865505eeaa9dcefc284af124f95ab7e0a67258b0c9a36bf864dd29c1cc53a3af"

      define_method(:install) do
        bin.install "prism-v0.87.5-linux-arm64" => "prism"
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
