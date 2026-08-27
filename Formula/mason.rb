# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.32.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.32.1/mason-v0.32.1-darwin-amd64"
      sha256 "e3ce821f6e0d3ac6741f8e2f32593ff9ea62502f9719015a2d39e63f656fb14c"

      define_method(:install) do
        bin.install "mason-v0.32.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.32.1/mason-v0.32.1-darwin-arm64"
      sha256 "35132f8a767e884a950ea77b7c4c2a288bf110338593767ed1ff82ac15422dd0"

      define_method(:install) do
        bin.install "mason-v0.32.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.32.1/mason-v0.32.1-linux-amd64"
      sha256 "a9a37f55cfb6010c6ea1a403a093120d7ac575c9e7ceb69137a9399160419285"

      define_method(:install) do
        bin.install "mason-v0.32.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.32.1/mason-v0.32.1-linux-arm64"
      sha256 "7f0bc9667a95acc4c6d8b2103eb4f223dcaa979f1bccbb4a68d14c3ba3728ecc"

      define_method(:install) do
        bin.install "mason-v0.32.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    assert_match "mason", shell_output("#{bin}/mason version")
  end
end
