# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.7/prism-v0.85.7-darwin-amd64"
      sha256 "f4a98e1c6618c09696bf2f7f8bc23b77210c8be5564120ef3ded4d68c994afa0"

      define_method(:install) do
        bin.install "prism-v0.85.7-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.7/prism-v0.85.7-darwin-arm64"
      sha256 "f8f53bbf2812b5cf524ea87146fff241b1ae3aa006fb557b940f61bb1764aa35"

      define_method(:install) do
        bin.install "prism-v0.85.7-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.7/prism-v0.85.7-linux-amd64"
      sha256 "d18d15ebd5efb857a395f62da1af8b2916576c563eb46999cd479d750837a671"

      define_method(:install) do
        bin.install "prism-v0.85.7-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.7/prism-v0.85.7-linux-arm64"
      sha256 "ce187cf07a9854c06677d9539b14fac2f910981a65d9cf5593108b4f5c1c72f9"

      define_method(:install) do
        bin.install "prism-v0.85.7-linux-arm64" => "prism"
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
