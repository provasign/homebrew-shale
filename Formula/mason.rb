# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.31.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.31.1/mason-v0.31.1-darwin-amd64"
      sha256 "5905d2ff2780c17248c8018681abc8b5ebc3a6fbc9aff75af745d25bd5ddb519"

      define_method(:install) do
        bin.install "mason-v0.31.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.31.1/mason-v0.31.1-darwin-arm64"
      sha256 "3f44946cfe313c2b4cd811fdf4067a33b542f18ef981b039e67c189bb71bd55c"

      define_method(:install) do
        bin.install "mason-v0.31.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.31.1/mason-v0.31.1-linux-amd64"
      sha256 "b31d0b142a6aa828c0b0d1faf853ba90c52d9af37c8951bc67dcd00f9df9e5b2"

      define_method(:install) do
        bin.install "mason-v0.31.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.31.1/mason-v0.31.1-linux-arm64"
      sha256 "b73f0f783b9f47fc86b60d471a4f39e16222da09e7b1d1909e77a4a3f4264583"

      define_method(:install) do
        bin.install "mason-v0.31.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    assert_match "mason", shell_output("#{bin}/mason version")
  end
end
