# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.39"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.39/prism-v0.87.39-darwin-amd64"
      sha256 "819c0c3255cb479c609ed67c719cfc58c527f288347f6fa53f39b90b1bb6c341"

      define_method(:install) do
        bin.install "prism-v0.87.39-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.39/prism-v0.87.39-darwin-arm64"
      sha256 "b2a00a3e9ba0312e19ac4a39d49bbec56c5064cd75dacb4953bf781f3b9daaec"

      define_method(:install) do
        bin.install "prism-v0.87.39-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.39/prism-v0.87.39-linux-amd64"
      sha256 "cba7c333a196140727f4800f57836f502d8439684d85a04bccd9ece57079d81c"

      define_method(:install) do
        bin.install "prism-v0.87.39-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.39/prism-v0.87.39-linux-arm64"
      sha256 "c640b81a4e4a21e6d0ba72dd6e759f2c6ff332ce1fd85a6d5d8c8d35d0ed5711"

      define_method(:install) do
        bin.install "prism-v0.87.39-linux-arm64" => "prism"
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
