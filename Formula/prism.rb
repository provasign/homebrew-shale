# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.83.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.83.3/prism-v0.83.3-darwin-amd64"
      sha256 "9c99efae2a1ad27f5cc359d09c15734d4055cb37c74a48c19714947f05c391b8"

      define_method(:install) do
        bin.install "prism-v0.83.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.83.3/prism-v0.83.3-darwin-arm64"
      sha256 "b32cae5d7b1ca89cf83c87268219e1873bc6bb119c2b0f91fcc797480f4ed651"

      define_method(:install) do
        bin.install "prism-v0.83.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.83.3/prism-v0.83.3-linux-amd64"
      sha256 "7b567f6a680cc125297a612652ffba8702e04b2d12574858bcecb8b7f744a19c"

      define_method(:install) do
        bin.install "prism-v0.83.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.83.3/prism-v0.83.3-linux-arm64"
      sha256 "88bbad2462692e597acce05399fab517eec64540c638b8037cb090528244476f"

      define_method(:install) do
        bin.install "prism-v0.83.3-linux-arm64" => "prism"
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
