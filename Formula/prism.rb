# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.7/prism-v0.87.7-darwin-amd64"
      sha256 "d7d369c61d6b029577c8da66a471c7b9a39d0d4659e1cdb75a9f50dc6237dc3e"

      define_method(:install) do
        bin.install "prism-v0.87.7-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.7/prism-v0.87.7-darwin-arm64"
      sha256 "545cecacd842cbd0e712b4439031ac376e3e0e47624fc06e8f18a15dcf6e1cdf"

      define_method(:install) do
        bin.install "prism-v0.87.7-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.7/prism-v0.87.7-linux-amd64"
      sha256 "4c94a10c18fc71dc2cbffe04780424e6a1f4bb511722273439877dcbb8baac29"

      define_method(:install) do
        bin.install "prism-v0.87.7-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.7/prism-v0.87.7-linux-arm64"
      sha256 "b819bb516d073ba6faf6d77f90f97e0c544de897443f4d9f474b4ebab48a91a2"

      define_method(:install) do
        bin.install "prism-v0.87.7-linux-arm64" => "prism"
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
