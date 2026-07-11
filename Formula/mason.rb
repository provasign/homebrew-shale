# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.4.1/mason-v0.4.1-darwin-amd64"
      sha256 "431b9788b5f352da2b1658af8a0dce16d6600b0d93a1eaa6de7332482edf0e5b"

      define_method(:install) do
        bin.install "mason-v0.4.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.4.1/mason-v0.4.1-darwin-arm64"
      sha256 "cd1bb0bfce672fcb8e0b2aaeef637913d7deb79a7da439c9fb2e2b092b9c4680"

      define_method(:install) do
        bin.install "mason-v0.4.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.4.1/mason-v0.4.1-linux-amd64"
      sha256 "8bb60886e4e4f9fecab816333ba5ab97c463ef258183d7d60fd2b6c31a311dcb"
      define_method(:install) do
        bin.install "mason-v0.4.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.4.1/mason-v0.4.1-linux-arm64"
      sha256 "6cab90edc8a92c7383a66899b50f05faffe9b840587784409f66e090dfe2371f"
      define_method(:install) do
        bin.install "mason-v0.4.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
