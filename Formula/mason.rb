# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.9.1/mason-v0.9.1-darwin-amd64"
      sha256 "a142d9a4e6d59e4c08ad7c995e5783255df392be3fb7d4584bfa31febbb376ce"

      define_method(:install) do
        bin.install "mason-v0.9.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.9.1/mason-v0.9.1-darwin-arm64"
      sha256 "c169cefa87e60dba287933b74f6de009c509947bd34eeca571d8efe59935fc5a"

      define_method(:install) do
        bin.install "mason-v0.9.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.9.1/mason-v0.9.1-linux-amd64"
      sha256 "44b715118a9d35bb74d26a8ae8baae5e26d17ddd04f7f719d1743c6e11a60dda"
      define_method(:install) do
        bin.install "mason-v0.9.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.9.1/mason-v0.9.1-linux-arm64"
      sha256 "b11cdbc489578436dc34a6d2af1395c1e1c85b7cef4482a19f7eccf1e0a9edf7"
      define_method(:install) do
        bin.install "mason-v0.9.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
