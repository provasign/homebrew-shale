# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.15/prism-v0.87.15-darwin-amd64"
      sha256 "09a358ae080e36a37805941012e0af12872679a42e91f671d949479b3b81506c"

      define_method(:install) do
        bin.install "prism-v0.87.15-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.15/prism-v0.87.15-darwin-arm64"
      sha256 "5a9de595b42984c620800257c165bc63efa2a4e7e21ff45262138ab700e7c8d5"

      define_method(:install) do
        bin.install "prism-v0.87.15-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.15/prism-v0.87.15-linux-amd64"
      sha256 "7c1cf793728d7d11fee99ea41d44ef500c55c42808a230b57405441471872441"

      define_method(:install) do
        bin.install "prism-v0.87.15-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.15/prism-v0.87.15-linux-arm64"
      sha256 "a3e18004e9c137a61cd3ca39b65fbe0677eb58b76275f44684c9633fd9f67c28"

      define_method(:install) do
        bin.install "prism-v0.87.15-linux-arm64" => "prism"
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
