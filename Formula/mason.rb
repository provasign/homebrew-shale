# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.5.1/mason-v0.5.1-darwin-amd64"
      sha256 "a7619b58af77d88750e35ea3bba715b4114698adc527dc8ee6fe22f5375cabe4"

      define_method(:install) do
        bin.install "mason-v0.5.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.5.1/mason-v0.5.1-darwin-arm64"
      sha256 "d992c4da2d184de0020a0580a9969c940e0b17e020f83dcb96316b09bc45d56d"

      define_method(:install) do
        bin.install "mason-v0.5.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.5.1/mason-v0.5.1-linux-amd64"
      sha256 "26791002b79feaa4898d72317d95c0c5482f9d92c27a39f4eaff6542ce428a5b"
      define_method(:install) do
        bin.install "mason-v0.5.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.5.1/mason-v0.5.1-linux-arm64"
      sha256 "bea01cdf00a54f89f09b984b69e592503a22f720f977351d382e7beb4fabe2a8"
      define_method(:install) do
        bin.install "mason-v0.5.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
