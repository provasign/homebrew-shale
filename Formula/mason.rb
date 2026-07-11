# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.5.0/mason-v0.5.0-darwin-amd64"
      sha256 "3253e97a84ca5cd25acbcc0030fb27ab470c4d9d3c0d6a002062287e46c1a2e7"

      define_method(:install) do
        bin.install "mason-v0.5.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.5.0/mason-v0.5.0-darwin-arm64"
      sha256 "2db051633c6532cc73292f9b39ed3da337bbd52b06d00e33f27349ced230f42f"

      define_method(:install) do
        bin.install "mason-v0.5.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.5.0/mason-v0.5.0-linux-amd64"
      sha256 "69b1b9cfa6fca929d5764e63ddbd2dfc6f906968d722fc7c299b17e70159f39b"
      define_method(:install) do
        bin.install "mason-v0.5.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.5.0/mason-v0.5.0-linux-arm64"
      sha256 "da90b7ed7b1d1ea6578a2d5295bacfafc95a0649e068e5a2b804ab2a74284cec"
      define_method(:install) do
        bin.install "mason-v0.5.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
