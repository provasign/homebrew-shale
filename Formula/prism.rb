# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.22.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.22.0/prism-v0.22.0-darwin-amd64"
      sha256 "33b10fc6be81b62c51c9819e79813268efd362dcf97098b8c0720da47e52d246"

      define_method(:install) do
        bin.install "prism-v0.22.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.22.0/prism-v0.22.0-darwin-arm64"
      sha256 "209be322608737ab202abaddaaa85115443d6c340ebd6c47babd0de3290db7e9"

      define_method(:install) do
        bin.install "prism-v0.22.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.22.0/prism-v0.22.0-linux-amd64"
      sha256 "283f94d89ec911c7fb169348636e47f6eff8ebfc0124aa417c57b583b210f518"
      define_method(:install) do
        bin.install "prism-v0.22.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.22.0/prism-v0.22.0-linux-arm64"
      sha256 "2bd9eb1cf58fc86eb4e456c7f61700295a4cbcc4bb252e4194423fd0fce57487"
      define_method(:install) do
        bin.install "prism-v0.22.0-linux-arm64" => "prism"
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
