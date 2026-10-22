# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.0.0/prism-v1.0.0-darwin-amd64"
      sha256 "a835e96556d014b38ac622151fded6ca791372367f4a192a40e2b9b61ba3e4eb"

      define_method(:install) do
        bin.install "prism-v1.0.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.0.0/prism-v1.0.0-darwin-arm64"
      sha256 "e56bedcb4f0c430510159f7fc60cb0e0c5d3896d3fee5efeb7584d0e21f50be9"

      define_method(:install) do
        bin.install "prism-v1.0.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.0.0/prism-v1.0.0-linux-amd64"
      sha256 "c0bf23d6d09a6f23bdad6d964abac9042162bbe403ceefcb137cbdb35e666b7f"

      define_method(:install) do
        bin.install "prism-v1.0.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.0.0/prism-v1.0.0-linux-arm64"
      sha256 "fc5c1a9867563c0c7a76721a47186f97573014b254c973104836b0d4929480b3"

      define_method(:install) do
        bin.install "prism-v1.0.0-linux-arm64" => "prism"
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
