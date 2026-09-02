# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.65.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.65.1/prism-v0.65.1-darwin-amd64"
      sha256 "8e34368c4b94ad3726c2c2292ed6e65702871180e4f08973c3f04359e02535f3"

      define_method(:install) do
        bin.install "prism-v0.65.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.65.1/prism-v0.65.1-darwin-arm64"
      sha256 "fc55da35da3a91c18985e0be596a57235da7e0c06cdc5ccc2c4f2c8bf345361f"

      define_method(:install) do
        bin.install "prism-v0.65.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.65.1/prism-v0.65.1-linux-amd64"
      sha256 "4986dd6ecc431d20ffee16a6d7b03cc8a5ad9b56ac088cca620c5abf60869929"

      define_method(:install) do
        bin.install "prism-v0.65.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.65.1/prism-v0.65.1-linux-arm64"
      sha256 "3b893053e2e9d72d3228c7e0a0c6c40b41b97487834f04ccaf4ac1ab0b9ba30a"

      define_method(:install) do
        bin.install "prism-v0.65.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
