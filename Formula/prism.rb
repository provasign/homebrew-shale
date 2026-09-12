# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.75.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.75.0/prism-v0.75.0-darwin-amd64"
      sha256 "1b1d32f9202a5c81e216d0863bd75261d7654fc0878420b7778af0c06de68a22"

      define_method(:install) do
        bin.install "prism-v0.75.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.75.0/prism-v0.75.0-darwin-arm64"
      sha256 "7e940b0ec5aede5a6ed1072e49210768e3a414b5880065117b87b6d64424d891"

      define_method(:install) do
        bin.install "prism-v0.75.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.75.0/prism-v0.75.0-linux-amd64"
      sha256 "74085b77de7b74499a14ab1dc5693d4940bef520643026b7b8c873225708d3f8"

      define_method(:install) do
        bin.install "prism-v0.75.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.75.0/prism-v0.75.0-linux-arm64"
      sha256 "b9d9098783c141b35ad394505876cc6aba9810a3fb28fb713dd5b020ed4b6df2"

      define_method(:install) do
        bin.install "prism-v0.75.0-linux-arm64" => "prism"
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
