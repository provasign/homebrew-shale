# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.41.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.41.1/prism-v0.41.1-darwin-amd64"
      sha256 "6622132fd62584d5c4f836b15e6795a089d2071ecea510e8fdaa34b6bc2cf1b8"

      define_method(:install) do
        bin.install "prism-v0.41.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.41.1/prism-v0.41.1-darwin-arm64"
      sha256 "37a5c2762d01bdcda954c3aed08141ea9e32f6e95bc74f351d41216d89623cf5"

      define_method(:install) do
        bin.install "prism-v0.41.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.41.1/prism-v0.41.1-linux-amd64"
      sha256 "9310db0788e49a2ea059d2f27edb95ab7f6b0cccc1c113fcd171806c0f97a1cc"

      define_method(:install) do
        bin.install "prism-v0.41.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.41.1/prism-v0.41.1-linux-arm64"
      sha256 "fa4ab37937245311622816e1e58d81b8375f42ded6f5b60597d6a836bfc22e03"

      define_method(:install) do
        bin.install "prism-v0.41.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
