# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.59.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.59.0/prism-v0.59.0-darwin-amd64"
      sha256 "359cc358752eb4e00a2b0801d4c96dcca8f05d5600652553058c2924800088ba"

      define_method(:install) do
        bin.install "prism-v0.59.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.59.0/prism-v0.59.0-darwin-arm64"
      sha256 "255d7f070f52e68f2fd3c9c0996618eabd7201216463fb06f33d82e2d666e94b"

      define_method(:install) do
        bin.install "prism-v0.59.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.59.0/prism-v0.59.0-linux-amd64"
      sha256 "a5b84e4acca6afd5cbc7a9b6bd0341b6c2e13b4b9d66f49d9382538c17a9964f"

      define_method(:install) do
        bin.install "prism-v0.59.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.59.0/prism-v0.59.0-linux-arm64"
      sha256 "c2aadffb40f696a8f4a14c146f96e9476dfa6e6a5379e3bfcaa462134840f226"

      define_method(:install) do
        bin.install "prism-v0.59.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
