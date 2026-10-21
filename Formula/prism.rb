# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.38"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.38/prism-v0.87.38-darwin-amd64"
      sha256 "4d3514b2422ee42f04cf2a263e6b98eab35f6963468f44f9ccba1a3b24bde6ef"

      define_method(:install) do
        bin.install "prism-v0.87.38-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.38/prism-v0.87.38-darwin-arm64"
      sha256 "0baf0305dbee8a10eb73dc4726cb36d203046ebc890e961b98e74e9b22c3daea"

      define_method(:install) do
        bin.install "prism-v0.87.38-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.38/prism-v0.87.38-linux-amd64"
      sha256 "7f3f624a3e09c4043e1e8329bfb7b921b0a13816d2df43e91f941813fcb10705"

      define_method(:install) do
        bin.install "prism-v0.87.38-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.38/prism-v0.87.38-linux-arm64"
      sha256 "aa4a768e80bab9353a0e6dea5cbce390b227d3b43aec74e0b448b6ef26933bb9"

      define_method(:install) do
        bin.install "prism-v0.87.38-linux-arm64" => "prism"
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
