# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.24"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.24/prism-v0.87.24-darwin-amd64"
      sha256 "3f650a4d15f375f8840e42c320a490c08153a47152df549d918ef3b63bd559bd"

      define_method(:install) do
        bin.install "prism-v0.87.24-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.24/prism-v0.87.24-darwin-arm64"
      sha256 "faf2e18ffdd0c09275a3c46130e69898e734677996e7aa5504bc10538e7f8eb4"

      define_method(:install) do
        bin.install "prism-v0.87.24-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.24/prism-v0.87.24-linux-amd64"
      sha256 "ed36040402a2c5bf7f4f8fcf46d42504fcb07c93562408fb5b64821b91e9bd63"

      define_method(:install) do
        bin.install "prism-v0.87.24-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.24/prism-v0.87.24-linux-arm64"
      sha256 "3c4ab0c58f3fa8cf0565e50de57d7379cd11e8f0358dc54a3afa393cb9c38ebe"

      define_method(:install) do
        bin.install "prism-v0.87.24-linux-arm64" => "prism"
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
