# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.8/prism-v0.85.8-darwin-amd64"
      sha256 "65ad4b4421ac3a270d0353ddae306a02fd0848c9ebc1c7b1f1aba166255f45ff"

      define_method(:install) do
        bin.install "prism-v0.85.8-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.8/prism-v0.85.8-darwin-arm64"
      sha256 "2c4d2c21ab70d419ed0725a7e749540e69258b725f067bd69155150f2751a913"

      define_method(:install) do
        bin.install "prism-v0.85.8-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.8/prism-v0.85.8-linux-amd64"
      sha256 "3857393a6958ab74f10d9416d04ab698b6cbf9055f7cb827a613b0ce304fbd1d"

      define_method(:install) do
        bin.install "prism-v0.85.8-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.8/prism-v0.85.8-linux-arm64"
      sha256 "82a7c05a82783ced634000e4e47462dc8dbebf5aa1c4fa22a7cb9a6df05fd7ea"

      define_method(:install) do
        bin.install "prism-v0.85.8-linux-arm64" => "prism"
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
