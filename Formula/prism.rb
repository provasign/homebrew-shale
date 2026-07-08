# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.21.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.21.1/prism-v0.21.1-darwin-amd64"
      sha256 "23c1adc20e5813531990df55edd202a908df1e7fe670f71510f3009f01aabbf0"

      define_method(:install) do
        bin.install "prism-v0.21.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.21.1/prism-v0.21.1-darwin-arm64"
      sha256 "f452de20516f1f3605640224c55c4cd84b4d3ea3d7b37523ce13a00dd708f15d"

      define_method(:install) do
        bin.install "prism-v0.21.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.21.1/prism-v0.21.1-linux-amd64"
      sha256 "0c1c4867d8b1b6f7c47c4b74db7300b450b5c6d494b74d961c44e2198b063b2e"
      define_method(:install) do
        bin.install "prism-v0.21.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.21.1/prism-v0.21.1-linux-arm64"
      sha256 "7882be28636a4c4eea4a116ddb69ff5099f88c198d9afb11a2811303bb915f5f"
      define_method(:install) do
        bin.install "prism-v0.21.1-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Register Prism with your AI tools from a project root:
        prism init . --mode both
    EOS
  end

  test do
    system "#{bin}/prism", "version"
  end
end
