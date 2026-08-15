# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.52.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.52.0/prism-v0.52.0-darwin-amd64"
      sha256 "2d2287c283786329d421c5247db5e1b7b77d7785bf5b4fc8129222e0d8346d58"

      define_method(:install) do
        bin.install "prism-v0.52.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.52.0/prism-v0.52.0-darwin-arm64"
      sha256 "cc6c0cf2942d8c092e52fa57cb756365ef09a6add5eea7424ab9789b1e0f67b9"

      define_method(:install) do
        bin.install "prism-v0.52.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.52.0/prism-v0.52.0-linux-amd64"
      sha256 "a1928de2fd0df22e82c78a3fa31c08c157e580cc3869b5d56a7138b9de32258c"

      define_method(:install) do
        bin.install "prism-v0.52.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.52.0/prism-v0.52.0-linux-arm64"
      sha256 "d90a71cdc242aa4565455e71c8dfa07f51379b56489bae0554c10f62209cce2c"

      define_method(:install) do
        bin.install "prism-v0.52.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
