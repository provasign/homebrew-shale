# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.71.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.71.1/prism-v0.71.1-darwin-amd64"
      sha256 "9f072a5c21f338cd2de0d730e120b16c2f784723050f0a231ce350e7bf050fac"

      define_method(:install) do
        bin.install "prism-v0.71.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.71.1/prism-v0.71.1-darwin-arm64"
      sha256 "717d377ce44d10c9e5d814eb32dc9850e7b978df243aa50da237ea400f07ca44"

      define_method(:install) do
        bin.install "prism-v0.71.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.71.1/prism-v0.71.1-linux-amd64"
      sha256 "8ca8019af3ae07170f7bd136eefd96661fd8efa7d41166423e01057875fd5f73"

      define_method(:install) do
        bin.install "prism-v0.71.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.71.1/prism-v0.71.1-linux-arm64"
      sha256 "683d2d4775bdf3fcd215663eea53ef3fc9c6f6851a476794dc4fb310819f4b16"

      define_method(:install) do
        bin.install "prism-v0.71.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
