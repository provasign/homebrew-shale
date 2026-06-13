# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.9.0/prism-v0.9.0-darwin-amd64"
      sha256 "896f1f34edbc0a8ac2eee9ea51d9286b0f89ca88ba2e03509d0ed7b8b7b89388"

      define_method(:install) do
        bin.install "prism-v0.9.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.9.0/prism-v0.9.0-darwin-arm64"
      sha256 "55eadfda99512462cd98939f03d116307882f47bbc22e6ec5338767a7f6aaf0e"

      define_method(:install) do
        bin.install "prism-v0.9.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.9.0/prism-v0.9.0-linux-amd64"
      sha256 "fe59042907af2c25a769fdff6a7576d915b07d42a778ab864d110d2b3a2d32b7"
      define_method(:install) do
        bin.install "prism-v0.9.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.9.0/prism-v0.9.0-linux-arm64"
      sha256 "55f47593e59031ffb5d0788d3c26d3d9d4fd2f2204456847d22af23037d7ce6e"
      define_method(:install) do
        bin.install "prism-v0.9.0-linux-arm64" => "prism"
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
