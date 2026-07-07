# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.20.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.20.2/prism-v0.20.2-darwin-amd64"
      sha256 "4413ed50af83183570438b787922af398fa08053c62ffaa3a9ce14b70f7018ae"

      define_method(:install) do
        bin.install "prism-v0.20.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.20.2/prism-v0.20.2-darwin-arm64"
      sha256 "b2fa3246285efbad37c8518bfc389a01d3e876fa3a0299f947450cc6179f6566"

      define_method(:install) do
        bin.install "prism-v0.20.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.20.2/prism-v0.20.2-linux-amd64"
      sha256 "3d56f546a5bbbc95bc9b477890d1389c2453354c7aba7dd72ada5c04ade44dea"
      define_method(:install) do
        bin.install "prism-v0.20.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.20.2/prism-v0.20.2-linux-arm64"
      sha256 "4db68292864f65fee6bfeee2356ab29594a2fe7cc1dbb2dc70979e7e06498a6a"
      define_method(:install) do
        bin.install "prism-v0.20.2-linux-arm64" => "prism"
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
