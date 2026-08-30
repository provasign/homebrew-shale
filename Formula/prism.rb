# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.61.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.61.1/prism-v0.61.1-darwin-amd64"
      sha256 "fca3b294ac76daadfaeb14d3c1277aef6d78a8d461541761eb891fa6b95cd55d"

      define_method(:install) do
        bin.install "prism-v0.61.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.61.1/prism-v0.61.1-darwin-arm64"
      sha256 "313551bf3b36fd89187849f77acfa4c5e75ce8f00a61ed08ab98fd44f7ff4b0a"

      define_method(:install) do
        bin.install "prism-v0.61.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.61.1/prism-v0.61.1-linux-amd64"
      sha256 "ac0d653c2b7c6461a4a33d63c6a91ac283421c4ffb99387831485967a5c07da6"

      define_method(:install) do
        bin.install "prism-v0.61.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.61.1/prism-v0.61.1-linux-arm64"
      sha256 "a9dc48d9564543946126c921124c18f93e037da6060f0623c521b75de3724a58"

      define_method(:install) do
        bin.install "prism-v0.61.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
