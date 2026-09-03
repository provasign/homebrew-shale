# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.68.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.68.0/prism-v0.68.0-darwin-amd64"
      sha256 "577f8bce10fe762ca6731e9c070f2660f2bbaceb93d48955e0538c15ffb54366"

      define_method(:install) do
        bin.install "prism-v0.68.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.68.0/prism-v0.68.0-darwin-arm64"
      sha256 "6ec0dd4a9ef4989ff5b3b9622306bcbf45a1042904877bc99fd9b075ddbed188"

      define_method(:install) do
        bin.install "prism-v0.68.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.68.0/prism-v0.68.0-linux-amd64"
      sha256 "044ed22b6cc605581c72414a97343270820744a75743c6fd7d1752c95a21f1d7"

      define_method(:install) do
        bin.install "prism-v0.68.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.68.0/prism-v0.68.0-linux-arm64"
      sha256 "a282c3aa6475e97f7f1f1ab30e61e025222cbaae88678a6b90612697574d3dbf"

      define_method(:install) do
        bin.install "prism-v0.68.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
