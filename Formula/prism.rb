# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.9/prism-v0.55.9-darwin-amd64"
      sha256 "6c15b3b03471a08f700b4114efc21673c1a6653579d024bd22666266a62ff556"

      define_method(:install) do
        bin.install "prism-v0.55.9-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.9/prism-v0.55.9-darwin-arm64"
      sha256 "b39bad7ae402f1caf8f51d17bcc207d343d62592bee3c2f727a4935c9560285f"

      define_method(:install) do
        bin.install "prism-v0.55.9-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.9/prism-v0.55.9-linux-amd64"
      sha256 "6859980033aa240e556992b5f92f31c11a6dc580376eca7fa44d94a7c89940ae"

      define_method(:install) do
        bin.install "prism-v0.55.9-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.9/prism-v0.55.9-linux-arm64"
      sha256 "107e9594079d844fb04c3b1139d51d40bbbe21cfdc2cf896af28af69269c4bb4"

      define_method(:install) do
        bin.install "prism-v0.55.9-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
