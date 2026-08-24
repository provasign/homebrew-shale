# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.32.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.32.0/mason-v0.32.0-darwin-amd64"
      sha256 "79d68b2c4e853fce1fc5812f120909eb94c9ebf346b76ed5ea0b6512f65fa772"

      define_method(:install) do
        bin.install "mason-v0.32.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.32.0/mason-v0.32.0-darwin-arm64"
      sha256 "f4201ac31a35f0bf430b40ea656565b06acad2f950b4f0912f11188312b29d46"

      define_method(:install) do
        bin.install "mason-v0.32.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.32.0/mason-v0.32.0-linux-amd64"
      sha256 "ac5d04df6bad9140e91ab88468f1d67463d1f4e3c90e9186f6e8b0330b530339"

      define_method(:install) do
        bin.install "mason-v0.32.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.32.0/mason-v0.32.0-linux-arm64"
      sha256 "d444567a5a5a921ce5e420a4a6e122c8b2e7c0e3c09f3e08b810e8ac541b0a64"

      define_method(:install) do
        bin.install "mason-v0.32.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    assert_match "mason", shell_output("#{bin}/mason version")
  end
end
