# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.45.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.45.0/prism-v0.45.0-darwin-amd64"
      sha256 "3c7612e58626a8110f2d2e9e4c30f12ff501cf788626cdf4cff3d7507b37cbb7"

      define_method(:install) do
        bin.install "prism-v0.45.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.45.0/prism-v0.45.0-darwin-arm64"
      sha256 "d5792e3101eced7a0808db8c1bccbf534602964cc606d3fb079495c5a34849bb"

      define_method(:install) do
        bin.install "prism-v0.45.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.45.0/prism-v0.45.0-linux-amd64"
      sha256 "bd83e16fc415cad19d0ed9467baf67adc22b9aed9ef67a363b85bce3a8b6c2cf"

      define_method(:install) do
        bin.install "prism-v0.45.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.45.0/prism-v0.45.0-linux-arm64"
      sha256 "e77381d3ab6720a6ecf8b8905b9fc38dd7f639344f88e0745154e1c49f8c6e48"

      define_method(:install) do
        bin.install "prism-v0.45.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
