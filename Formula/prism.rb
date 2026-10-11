# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.6/prism-v0.87.6-darwin-amd64"
      sha256 "65898adf2f03244502f316a1cedc897f13cdb96287c318705ed2ca2a872d872d"

      define_method(:install) do
        bin.install "prism-v0.87.6-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.6/prism-v0.87.6-darwin-arm64"
      sha256 "4e21c21ea4578accbffb49c8921e0170f9bafd22081fd4389d812bdb3f26a3fd"

      define_method(:install) do
        bin.install "prism-v0.87.6-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.6/prism-v0.87.6-linux-amd64"
      sha256 "bfc8e5107308b5ba1adf1895a9e3f570607e8cc7a60562fbaf56703f2a924ac5"

      define_method(:install) do
        bin.install "prism-v0.87.6-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.6/prism-v0.87.6-linux-arm64"
      sha256 "9370f1e0a412ec776cd7981789210fcd81670cd3d5ceae403a05417ab0687451"

      define_method(:install) do
        bin.install "prism-v0.87.6-linux-arm64" => "prism"
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
