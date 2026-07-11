# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.3.0/mason-v0.3.0-darwin-amd64"
      sha256 "998aec8dfe6a238f3c8fc564e1417f65de9a7d5ff9b6a09c4919f8abb7c9b148"

      define_method(:install) do
        bin.install "mason-v0.3.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.3.0/mason-v0.3.0-darwin-arm64"
      sha256 "d8cde98b4f26d1ba29fb9af380a776a55cce43b2278dc37a93daf861ec21d530"

      define_method(:install) do
        bin.install "mason-v0.3.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.3.0/mason-v0.3.0-linux-amd64"
      sha256 "e2f6270817ff80ffcb628c07891901525821f4f0d998ee18b04b84682868a10b"
      define_method(:install) do
        bin.install "mason-v0.3.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.3.0/mason-v0.3.0-linux-arm64"
      sha256 "430bcbddc94d2ca90196f3a0b62843cb7d5714aba90b732be786a6b15c186e05"
      define_method(:install) do
        bin.install "mason-v0.3.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
