# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.42.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.42.0/prism-v0.42.0-darwin-amd64"
      sha256 "c93af6edf413d1faebed8a16e16c160b9d5495216a40a73a6e558739b20a2a91"

      define_method(:install) do
        bin.install "prism-v0.42.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.42.0/prism-v0.42.0-darwin-arm64"
      sha256 "7b7e77be992d542b69089b394563bab8a4f11db71e0c7d1a5a3eedb2c53098fd"

      define_method(:install) do
        bin.install "prism-v0.42.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.42.0/prism-v0.42.0-linux-amd64"
      sha256 "5d51560827a0fe0098d53d577e0850244aac9b4d8a0a45b3adb7bc2d45e5dc6d"

      define_method(:install) do
        bin.install "prism-v0.42.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.42.0/prism-v0.42.0-linux-arm64"
      sha256 "7b3ca614362db5fdb4de2b358f4a7bee414295692b926dce73c552b2357b107c"

      define_method(:install) do
        bin.install "prism-v0.42.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
