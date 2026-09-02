# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.65.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.65.0/prism-v0.65.0-darwin-amd64"
      sha256 "59a51f6d0dce904e8aa73b435781f4f4dd2d4dde2e72485ed7388d7db0e78581"

      define_method(:install) do
        bin.install "prism-v0.65.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.65.0/prism-v0.65.0-darwin-arm64"
      sha256 "0a4f701660f1fd6994c3b2ece757159276adff51e4f516d6f8942e0f54d1762f"

      define_method(:install) do
        bin.install "prism-v0.65.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.65.0/prism-v0.65.0-linux-amd64"
      sha256 "5c1c3cc047c3a1ea8f0732b61f76c90073da0e34184553074fc5fa186930a6f7"

      define_method(:install) do
        bin.install "prism-v0.65.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.65.0/prism-v0.65.0-linux-arm64"
      sha256 "413537c576ddac319a4eee90978e36a09a5f5532474d6df3d45e2cae79cce5a0"

      define_method(:install) do
        bin.install "prism-v0.65.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
