# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.9/prism-v0.87.9-darwin-amd64"
      sha256 "1a0a6e702fb74c6fb54aa4e37f8a8900acb2fc649d3d4b4760eea4a5c6376609"

      define_method(:install) do
        bin.install "prism-v0.87.9-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.9/prism-v0.87.9-darwin-arm64"
      sha256 "4d8de9a83cae27cb228fc62945e4892136e2af4026eaabb9476162b01c2a945a"

      define_method(:install) do
        bin.install "prism-v0.87.9-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.9/prism-v0.87.9-linux-amd64"
      sha256 "aa3ddf3bce287aaf3b609928acdbd5770925d724ddb1a20c58464a7d1466f3f1"

      define_method(:install) do
        bin.install "prism-v0.87.9-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.9/prism-v0.87.9-linux-arm64"
      sha256 "76e2de7662caec7a0ea1bbac7c084a2f0ffc3ed6712d0f7db213662808b5a87f"

      define_method(:install) do
        bin.install "prism-v0.87.9-linux-arm64" => "prism"
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
