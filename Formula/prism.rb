# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.78.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.78.0/prism-v0.78.0-darwin-amd64"
      sha256 "dff86977492e16f66d08f5e64ef10dc65fa27dd6300820e343b6214b10db8310"

      define_method(:install) do
        bin.install "prism-v0.78.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.78.0/prism-v0.78.0-darwin-arm64"
      sha256 "4eaa664b6fbef502234de9ccdf699d033b456f7fdf8b23a939e4f241d832ce15"

      define_method(:install) do
        bin.install "prism-v0.78.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.78.0/prism-v0.78.0-linux-amd64"
      sha256 "bf296d43a29a7c9e7164c472e0758ca2232d07f428fd9404efa2a29967e519bf"

      define_method(:install) do
        bin.install "prism-v0.78.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.78.0/prism-v0.78.0-linux-arm64"
      sha256 "5e76676da9d39cda0a44bf8441b5bf0496577c3c2fcfaa92d63550b360ff2e14"

      define_method(:install) do
        bin.install "prism-v0.78.0-linux-arm64" => "prism"
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
