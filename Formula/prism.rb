# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.0/prism-v0.72.0-darwin-amd64"
      sha256 "f03d585fecf8020eadf31c0fc040ab70cb6a82a0b709ab7c4efdae4c00eee14c"

      define_method(:install) do
        bin.install "prism-v0.72.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.0/prism-v0.72.0-darwin-arm64"
      sha256 "41d52ec37dcba5e3de7fd3aaccbdc06eeeb3f3a73cf726fc003e5c6581249e05"

      define_method(:install) do
        bin.install "prism-v0.72.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.0/prism-v0.72.0-linux-amd64"
      sha256 "136f313457a7de2e1c10985acfebc0dd1dc9c36c7dd938230d334517e89a79e2"

      define_method(:install) do
        bin.install "prism-v0.72.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.0/prism-v0.72.0-linux-arm64"
      sha256 "29dc9a79b4ae738a18605af2dbaa5050f80eef5e59ec48c870c11c194fa282a3"

      define_method(:install) do
        bin.install "prism-v0.72.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
