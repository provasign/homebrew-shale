# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.7.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.7.4/mason-v0.7.4-darwin-amd64"
      sha256 "1d69255a73a1cabb3694654ec84b4125e0976494ac962ddb5f8891592bc0d8d7"

      define_method(:install) do
        bin.install "mason-v0.7.4-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.7.4/mason-v0.7.4-darwin-arm64"
      sha256 "9621b885f5e2982dacc0886d1dffa78fe19979b30092d5d88efbd9f96ebfe049"

      define_method(:install) do
        bin.install "mason-v0.7.4-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.4/mason-v0.7.4-linux-amd64"
      sha256 "58064f094b7b95ed4b897f44c6ed5ebc34f32689dedde069c4f877c40fd20425"
      define_method(:install) do
        bin.install "mason-v0.7.4-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.4/mason-v0.7.4-linux-arm64"
      sha256 "154dc9c5789256c481b7df59b7df23e648f32f4e4ad6601489305ca5333dce52"
      define_method(:install) do
        bin.install "mason-v0.7.4-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
