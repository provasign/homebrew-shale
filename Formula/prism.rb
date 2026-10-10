# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.0/prism-v0.87.0-darwin-amd64"
      sha256 "b732b522dbb0d8a82e0c610671eed975f080245b3d15db034b0fbdbc284bf644"

      define_method(:install) do
        bin.install "prism-v0.87.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.0/prism-v0.87.0-darwin-arm64"
      sha256 "70e38ae7a6d5b5107556b9258013e207bc0929c33e93238c406a5f67ecda9e06"

      define_method(:install) do
        bin.install "prism-v0.87.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.0/prism-v0.87.0-linux-amd64"
      sha256 "38e581843a9fc47fc0b3c5eeded30cf854778bf9671a6dba036e7841cd97e58d"

      define_method(:install) do
        bin.install "prism-v0.87.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.0/prism-v0.87.0-linux-arm64"
      sha256 "c55bf9169b0d502187dd99534abf89e34cca70bbc6a4d8cbd9aae63fdc225dcf"

      define_method(:install) do
        bin.install "prism-v0.87.0-linux-arm64" => "prism"
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
