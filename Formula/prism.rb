# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.53.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.53.0/prism-v0.53.0-darwin-amd64"
      sha256 "c3e9250dcd8736da227fd9c2c7b8261c99c267665bc08d59a69ab2f62a6d08dd"

      define_method(:install) do
        bin.install "prism-v0.53.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.53.0/prism-v0.53.0-darwin-arm64"
      sha256 "3bfb108fb9a9a2a1fecc6e16713fe8f831da9f43edb209e55446cb9b541ea256"

      define_method(:install) do
        bin.install "prism-v0.53.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.53.0/prism-v0.53.0-linux-amd64"
      sha256 "29dc79d991db8c2ee8076dcf7c49501ba42dc8d377198f7de99f62d661b1de76"

      define_method(:install) do
        bin.install "prism-v0.53.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.53.0/prism-v0.53.0-linux-arm64"
      sha256 "f7d486e247d0299b445b86a9e8c64497ced2a70ab7fbb463e42bc056a43d0259"

      define_method(:install) do
        bin.install "prism-v0.53.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
