# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.7/prism-v0.19.7-darwin-amd64"
      sha256 "bf47d477aa11db4326054520952f1c3f2393b7784431dbd2657118e26c7f653d"

      define_method(:install) do
        bin.install "prism-v0.19.7-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.7/prism-v0.19.7-darwin-arm64"
      sha256 "193a82ad5a93639290185963e329eb0f06f09505f8183a464cb3acf623b20fe6"

      define_method(:install) do
        bin.install "prism-v0.19.7-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.7/prism-v0.19.7-linux-amd64"
      sha256 "a288cbae3c86bc67729cd055f62512d25c6e5c7852a9941a890d0d2c99116256"
      define_method(:install) do
        bin.install "prism-v0.19.7-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.7/prism-v0.19.7-linux-arm64"
      sha256 "91b30257e1c4177540af66e0ecafb4d80abb6fc18ce1fa6026632e909cd272f5"
      define_method(:install) do
        bin.install "prism-v0.19.7-linux-arm64" => "prism"
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
