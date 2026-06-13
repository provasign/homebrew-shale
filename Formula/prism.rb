# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.10.0/prism-v0.10.0-darwin-amd64"
      sha256 "c7c9e92989aa15aa2c2e3b29c3ab4d06b1ab6d7a19dbb863e5a467db1a0f823a"

      define_method(:install) do
        bin.install "prism-v0.10.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.10.0/prism-v0.10.0-darwin-arm64"
      sha256 "8f852f5b6955e1ce5754cb6a1258dffbb2773493db4212bcc2c14223ba34be28"

      define_method(:install) do
        bin.install "prism-v0.10.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.10.0/prism-v0.10.0-linux-amd64"
      sha256 "1f9a02b36b37313a68cc85241f4a2c1371c044f0f9804c415621aeaba056885c"
      define_method(:install) do
        bin.install "prism-v0.10.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.10.0/prism-v0.10.0-linux-arm64"
      sha256 "ebfc4c879f54567c7af477b43fe3edfb81b68aa82f11fd502d2b4581ac453cd4"
      define_method(:install) do
        bin.install "prism-v0.10.0-linux-arm64" => "prism"
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
