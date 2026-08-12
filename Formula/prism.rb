# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.47.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.47.0/prism-v0.47.0-darwin-amd64"
      sha256 "7916d0f27a7f7716744ea6e737b6c19962d5cfbdcbe8ed31c1631ef8c5f523d7"

      define_method(:install) do
        bin.install "prism-v0.47.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.47.0/prism-v0.47.0-darwin-arm64"
      sha256 "51f5bebbc4f41cb79f4d52208b6441d19c30b78445ec863dc907cdd3909f343c"

      define_method(:install) do
        bin.install "prism-v0.47.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.47.0/prism-v0.47.0-linux-amd64"
      sha256 "b8a7feec3670df1a1018d3295dac2a4e05c7f54373e9f0290d1ed0543e96cd76"

      define_method(:install) do
        bin.install "prism-v0.47.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.47.0/prism-v0.47.0-linux-arm64"
      sha256 "5db55f0829e3ce02c0258d6282611c6ba41696bce0ddf50b7a81e660af826b63"

      define_method(:install) do
        bin.install "prism-v0.47.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
