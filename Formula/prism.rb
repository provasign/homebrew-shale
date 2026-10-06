# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.4/prism-v0.86.4-darwin-amd64"
      sha256 "3fcf30ff89e7c91d79054c099e75a5553214b945d88d9a99d4639a74853c7296"

      define_method(:install) do
        bin.install "prism-v0.86.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.4/prism-v0.86.4-darwin-arm64"
      sha256 "8a429bc6c2877248442654a9a51130eff150a4c3e78c47d61bcad6472b11dd25"

      define_method(:install) do
        bin.install "prism-v0.86.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.4/prism-v0.86.4-linux-amd64"
      sha256 "d63a220a458311815f57ff1621aa3e26c637eda00d7a3608dad11861a2955cee"

      define_method(:install) do
        bin.install "prism-v0.86.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.4/prism-v0.86.4-linux-arm64"
      sha256 "eaed15bb56d31cbdab1872179aef215fe4cdcba05b5abd35466d622e8eda612d"

      define_method(:install) do
        bin.install "prism-v0.86.4-linux-arm64" => "prism"
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
