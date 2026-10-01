# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.5/prism-v0.85.5-darwin-amd64"
      sha256 "4a46f3823551f8816fb1833fd249fe2d84d184b2d26e142cb02edc2145e32df6"

      define_method(:install) do
        bin.install "prism-v0.85.5-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.5/prism-v0.85.5-darwin-arm64"
      sha256 "a4bd1e9601f74c7beecee1036c24efe8fa02f9055ef2c6fa201d826b6c95dcd2"

      define_method(:install) do
        bin.install "prism-v0.85.5-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.5/prism-v0.85.5-linux-amd64"
      sha256 "e90e93553b1676d013f8139fe34c639ad8f60470e8aa80a868c6d80c21b54699"

      define_method(:install) do
        bin.install "prism-v0.85.5-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.5/prism-v0.85.5-linux-arm64"
      sha256 "fe0b9e195e5dff3fe47a834ce5504b50798c5c4765779f60f93697a11dc4885d"

      define_method(:install) do
        bin.install "prism-v0.85.5-linux-arm64" => "prism"
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
