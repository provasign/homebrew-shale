# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.15.0/mason-v0.15.0-darwin-amd64"
      sha256 "2aca99d0f270ac4764a2258df1c50409d285db43283ec9f575f96ee7375faef2"

      define_method(:install) do
        bin.install "mason-v0.15.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.15.0/mason-v0.15.0-darwin-arm64"
      sha256 "a8ed6233ade4f569a4fb3fa69f770198be30267d2d33b8568e2f834db858d401"

      define_method(:install) do
        bin.install "mason-v0.15.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.15.0/mason-v0.15.0-linux-amd64"
      sha256 "40ecab95409aaaf5f6f64d959e04067aecea13a185b624725039168048cafd41"
      define_method(:install) do
        bin.install "mason-v0.15.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.15.0/mason-v0.15.0-linux-arm64"
      sha256 "79a0c047982829d1c4f95bac000a61a9fafb4355ba1cbb9e13f1a9ea69100c27"
      define_method(:install) do
        bin.install "mason-v0.15.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
