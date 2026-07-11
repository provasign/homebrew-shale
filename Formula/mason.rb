# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.13.0/mason-v0.13.0-darwin-amd64"
      sha256 "f3abe59ef91de5ebfad436f1ee9d645a319c64ef074e5197c943af147d0c32e9"

      define_method(:install) do
        bin.install "mason-v0.13.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.13.0/mason-v0.13.0-darwin-arm64"
      sha256 "955ddf19e29c4a8e1dc5e22589ae4402b31b507702c309580668d82d3cd4e4dd"

      define_method(:install) do
        bin.install "mason-v0.13.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.13.0/mason-v0.13.0-linux-amd64"
      sha256 "89a5a2dd9bb61691498e324c0b3900cc29577b1207605648dcdb4db10df9fa06"
      define_method(:install) do
        bin.install "mason-v0.13.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.13.0/mason-v0.13.0-linux-arm64"
      sha256 "e5f0d235b75a116ca7697e3847953074c0a1fb2fb5ea868292527d7297eaf176"
      define_method(:install) do
        bin.install "mason-v0.13.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
