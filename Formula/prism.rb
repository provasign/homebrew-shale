# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.0/prism-v0.55.0-darwin-amd64"
      sha256 "e3ed7fe6470b46ee75638cb6dacc219c49ba42be2cd053ec6b01e13719855f11"

      define_method(:install) do
        bin.install "prism-v0.55.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.0/prism-v0.55.0-darwin-arm64"
      sha256 "7cca24005f38d60a942476cb65468b61a5c77ff3f49f698855c3903babe4ab3a"

      define_method(:install) do
        bin.install "prism-v0.55.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.0/prism-v0.55.0-linux-amd64"
      sha256 "88d0b2c42ded3a04dd8398cddc5412c4aff1890eb1d25e1519ea0183ef14ac90"

      define_method(:install) do
        bin.install "prism-v0.55.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.0/prism-v0.55.0-linux-arm64"
      sha256 "6bc948dc418bc6d397e4597cfbfc8e4093872125ccbd2308957db55770539574"

      define_method(:install) do
        bin.install "prism-v0.55.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
