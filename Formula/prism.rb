# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.1/prism-v0.72.1-darwin-amd64"
      sha256 "447c72c05efb7222b048f92a459bc00591bd12e795d9b2ed60a17d307d02b1a6"

      define_method(:install) do
        bin.install "prism-v0.72.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.1/prism-v0.72.1-darwin-arm64"
      sha256 "e6850735a0f4b2541b801e5e8b00a755726105d2d5aedf1fd4cc88e2f0286252"

      define_method(:install) do
        bin.install "prism-v0.72.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.1/prism-v0.72.1-linux-amd64"
      sha256 "91c8e41076a6661d6677707445a69cf939ee4ab20efa643dd120c029297d71a3"

      define_method(:install) do
        bin.install "prism-v0.72.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.1/prism-v0.72.1-linux-arm64"
      sha256 "266b6599df0c18501292d2e5033e2072801e5d16acaf7f4f44f7c93c49758219"

      define_method(:install) do
        bin.install "prism-v0.72.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
