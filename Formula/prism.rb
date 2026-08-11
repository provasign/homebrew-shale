# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.44.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.44.0/prism-v0.44.0-darwin-amd64"
      sha256 "c6e02f808dd126320d24f667531704ba93a9ed803c4c39a016de98155d1ce541"

      define_method(:install) do
        bin.install "prism-v0.44.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.44.0/prism-v0.44.0-darwin-arm64"
      sha256 "cf3bd80d9893f911c82a6375e402a29fe81bd3fb43321454021698b2c0a72f77"

      define_method(:install) do
        bin.install "prism-v0.44.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.44.0/prism-v0.44.0-linux-amd64"
      sha256 "0211bd79d4e01daad7445ecc53e27259589a9e7b4ad878b5d3d3f70193539bbf"

      define_method(:install) do
        bin.install "prism-v0.44.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.44.0/prism-v0.44.0-linux-arm64"
      sha256 "f382d9c3b69e1bb95add91c89e1d7bbbafd2f5e77bbf29554a355071f814a035"

      define_method(:install) do
        bin.install "prism-v0.44.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
