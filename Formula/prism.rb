# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.63.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.63.0/prism-v0.63.0-darwin-amd64"
      sha256 "c6b03f942543a62f8c24fe28a41df2953b06d79c985aceeb29a77b929881f3cc"

      define_method(:install) do
        bin.install "prism-v0.63.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.63.0/prism-v0.63.0-darwin-arm64"
      sha256 "c0d249a558fb1e388f58d9d2e877268328ab67c9b8ff96fba9edb76d11255222"

      define_method(:install) do
        bin.install "prism-v0.63.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.63.0/prism-v0.63.0-linux-amd64"
      sha256 "b981cccf49753c728526f469edef018a3b2c402b8f210b5a68b688a05d7a430b"

      define_method(:install) do
        bin.install "prism-v0.63.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.63.0/prism-v0.63.0-linux-arm64"
      sha256 "5eeb68c194c4155206604be10da3dcaf54febe08af8bf25d3337366c07b66916"

      define_method(:install) do
        bin.install "prism-v0.63.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
