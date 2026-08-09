# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.38.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.38.3/prism-v0.38.3-darwin-amd64"
      sha256 "85576b4b671535ed4afc2ea84efaec3c2a7dce4d079497c7b85c65090ee040e6"

      define_method(:install) do
        bin.install "prism-v0.38.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.38.3/prism-v0.38.3-darwin-arm64"
      sha256 "9177ab924232a75211390a1a891c54d34cabc6833c62240fda0f074e1ad3d89f"

      define_method(:install) do
        bin.install "prism-v0.38.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.38.3/prism-v0.38.3-linux-amd64"
      sha256 "8a97ff2af05bf381c80a8d7a1c73a334afb2af9ced0eb0d9594969064b00dbdf"

      define_method(:install) do
        bin.install "prism-v0.38.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.38.3/prism-v0.38.3-linux-arm64"
      sha256 "46a7261423af21f5be420c052bbbce47266f5ec341879e553df049a09c00fb0a"

      define_method(:install) do
        bin.install "prism-v0.38.3-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
