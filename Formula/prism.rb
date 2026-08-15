# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.51.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.51.0/prism-v0.51.0-darwin-amd64"
      sha256 "121781561281b524e4148e926ff7cf010ef3d2db8ccf34c9e93eb7255a6b9c8e"

      define_method(:install) do
        bin.install "prism-v0.51.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.51.0/prism-v0.51.0-darwin-arm64"
      sha256 "f8c1b60e6dd67deb14ae95d63b4e3809ad1515fd8a205ba82e10498de970f3e3"

      define_method(:install) do
        bin.install "prism-v0.51.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.51.0/prism-v0.51.0-linux-amd64"
      sha256 "46484419b68f4b52b1d38bfe1d2940c267e78c134cae16b01e010fac89ef5638"

      define_method(:install) do
        bin.install "prism-v0.51.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.51.0/prism-v0.51.0-linux-arm64"
      sha256 "c55f84a800917829314128248052ce917dd05956c62a755c362258439df56713"

      define_method(:install) do
        bin.install "prism-v0.51.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
