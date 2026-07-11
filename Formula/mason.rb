# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.1.1/mason-v0.1.1-darwin-amd64"
      sha256 "ca6cb9ecde1c01840b1c3e2054491055818d5f7fb7c14d8d502575dbd68a7b68"

      define_method(:install) do
        bin.install "mason-v0.1.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.1.1/mason-v0.1.1-darwin-arm64"
      sha256 "62d29679e522e3ff2e1a1fa44bac65c29272245190cfc91f17e395908b15a521"

      define_method(:install) do
        bin.install "mason-v0.1.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.1.1/mason-v0.1.1-linux-amd64"
      sha256 "28f3eb410856e204b1f8f04a5dba9363ef2401a336e5fbdaae42b505b86445fe"
      define_method(:install) do
        bin.install "mason-v0.1.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.1.1/mason-v0.1.1-linux-arm64"
      sha256 "d36d71410b518657ad82885d4eab09e849e1d7a5dd2fe9396e871fd01232cebd"
      define_method(:install) do
        bin.install "mason-v0.1.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
