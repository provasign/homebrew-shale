# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.69.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.69.2/prism-v0.69.2-darwin-amd64"
      sha256 "557cee76299c0a28b4c3eb317ae6bc7ddda555b46ef0f2aed5bf86eab0e9b3e0"

      define_method(:install) do
        bin.install "prism-v0.69.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.69.2/prism-v0.69.2-darwin-arm64"
      sha256 "c5dfe7b1314895d849976afe641676b58807af325f9fe025a69ee9159dd9f269"

      define_method(:install) do
        bin.install "prism-v0.69.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.69.2/prism-v0.69.2-linux-amd64"
      sha256 "a39fcf2406a30f6a3b55f075f824d777dd02d6cc995c034b1363fe1be1754b10"

      define_method(:install) do
        bin.install "prism-v0.69.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.69.2/prism-v0.69.2-linux-arm64"
      sha256 "c75c9e95fff5a06c2f7ad4b2e926e58cef7905fd0264ed47da1a8b077bdca720"

      define_method(:install) do
        bin.install "prism-v0.69.2-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
