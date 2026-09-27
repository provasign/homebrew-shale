# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.84.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.84.3/prism-v0.84.3-darwin-amd64"
      sha256 "30cb6fa0ed3d91fcfe03a278c207c5db7e4ed64d3cfddbedb5ce2ef8dd002cb9"

      define_method(:install) do
        bin.install "prism-v0.84.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.84.3/prism-v0.84.3-darwin-arm64"
      sha256 "9cf86e8b428a36a801ae9f05d282d52a78e58e4d9997e87f6ae4483c5e9cc1cd"

      define_method(:install) do
        bin.install "prism-v0.84.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.3/prism-v0.84.3-linux-amd64"
      sha256 "ca95140378eb52c777b931e18843498a93b3015347a0e43606fcf88f716455f9"

      define_method(:install) do
        bin.install "prism-v0.84.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.3/prism-v0.84.3-linux-arm64"
      sha256 "6049f6b23ceb5bb406bc7d78e4e1f8cf550be6153a7d46a1141b0c16027cc088"

      define_method(:install) do
        bin.install "prism-v0.84.3-linux-arm64" => "prism"
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
