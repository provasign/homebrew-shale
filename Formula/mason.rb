# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.7.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.7.2/mason-v0.7.2-darwin-amd64"
      sha256 "0d9d8c9ad9007c19fa6d5cdb7b7fe93dddfd9871087d5f803905f5fec72ae58a"

      define_method(:install) do
        bin.install "mason-v0.7.2-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.7.2/mason-v0.7.2-darwin-arm64"
      sha256 "9277c425880afd6d26cc4650e476258217cc30c6c8cc97bcc9fd67fb346e93d1"

      define_method(:install) do
        bin.install "mason-v0.7.2-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.2/mason-v0.7.2-linux-amd64"
      sha256 "db27efb786650eeff0933a94bcda16f26549f61c6ed37afcde779a40e31c6238"
      define_method(:install) do
        bin.install "mason-v0.7.2-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.2/mason-v0.7.2-linux-arm64"
      sha256 "c052996a387f7c56b778c80e019191a49e2ac9bcd02ff3ae9420656d6e82c7ce"
      define_method(:install) do
        bin.install "mason-v0.7.2-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
