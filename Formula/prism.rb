# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.62.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.62.0/prism-v0.62.0-darwin-amd64"
      sha256 "a3764ced5c8835472180142c7cf4b1a0c9b7a7abc4a31bb04d82abe583226e6a"

      define_method(:install) do
        bin.install "prism-v0.62.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.62.0/prism-v0.62.0-darwin-arm64"
      sha256 "5bb5b74db35fe8932952baa471273b0e0b70cc5385c4be7bed646bd52241b726"

      define_method(:install) do
        bin.install "prism-v0.62.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.62.0/prism-v0.62.0-linux-amd64"
      sha256 "7c540b8f0365c6fbb7db2f71e207333fef84a5fb41a98ef90bb85ae3df19eb86"

      define_method(:install) do
        bin.install "prism-v0.62.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.62.0/prism-v0.62.0-linux-arm64"
      sha256 "188ea4fd6a1130bc813bbc6c725e155bbd071b6dee01b06f38fa5e29f7374c50"

      define_method(:install) do
        bin.install "prism-v0.62.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
