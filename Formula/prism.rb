# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.10/prism-v0.87.10-darwin-amd64"
      sha256 "0a004d6720c0c2e9beed49ad76feadaf9c571b46372b912d77617b42ee656b4f"

      define_method(:install) do
        bin.install "prism-v0.87.10-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.10/prism-v0.87.10-darwin-arm64"
      sha256 "d6ec92b303757f818299ce37211340e7c43786d891e5d4a0bbd7eaefcd177b29"

      define_method(:install) do
        bin.install "prism-v0.87.10-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.10/prism-v0.87.10-linux-amd64"
      sha256 "6a3f87e5f39033565da68e491055475727ffc85e8b50680e1aa36d529e0d55ef"

      define_method(:install) do
        bin.install "prism-v0.87.10-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.10/prism-v0.87.10-linux-arm64"
      sha256 "67427edcdbfc8fc4d77c9d756d2b4d8d8c1cf2a482beb89eaf08c04136c729a7"

      define_method(:install) do
        bin.install "prism-v0.87.10-linux-arm64" => "prism"
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
