# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.8.0/mason-v0.8.0-darwin-amd64"
      sha256 "15977928b9b9597bab2ae53c700aa5265c8ca2ce108e3782a57051aaf881b326"

      define_method(:install) do
        bin.install "mason-v0.8.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.8.0/mason-v0.8.0-darwin-arm64"
      sha256 "fd71dc997eef517b69cf4b5b3a1a28b727c15fae6b2009abc11e551dc10e3f4e"

      define_method(:install) do
        bin.install "mason-v0.8.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.8.0/mason-v0.8.0-linux-amd64"
      sha256 "cfc80b1c8f04ad44fb4605826517072d02018b8e9928b4f08c41e11646c55d86"
      define_method(:install) do
        bin.install "mason-v0.8.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.8.0/mason-v0.8.0-linux-arm64"
      sha256 "25bb847fee3734f0a40c7852d93ad9924c0420c53daa3c3f4ec37af9282abccb"
      define_method(:install) do
        bin.install "mason-v0.8.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
