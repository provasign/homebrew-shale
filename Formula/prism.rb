# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.32"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.32/prism-v0.87.32-darwin-amd64"
      sha256 "cc9cb7e4b1575080e074fba6384837e68ca19a7299699c6fcd40dad105ae8b85"

      define_method(:install) do
        bin.install "prism-v0.87.32-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.32/prism-v0.87.32-darwin-arm64"
      sha256 "fff1dfd04f03e337b82f429632978c7261c89585c6a1149f902a9d94d84577f2"

      define_method(:install) do
        bin.install "prism-v0.87.32-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.32/prism-v0.87.32-linux-amd64"
      sha256 "1466ce7c397e0a82a0bb1f7928806816b30f049278e33e284cf9a83b1642411c"

      define_method(:install) do
        bin.install "prism-v0.87.32-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.32/prism-v0.87.32-linux-arm64"
      sha256 "6123cd67d326f3bdfc66a1b7845b77a8010a508d1f5c382d7b94866b60ec2c9b"

      define_method(:install) do
        bin.install "prism-v0.87.32-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Run `prism init` inside each project after installing or upgrading to
      configure supported AI clients. Prism setup is project-scoped;
      `prism init --global` is no longer supported.

      Restart or reload running AI clients after upgrading Prism.

      Prism reports other installed copies when their versions differ.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
