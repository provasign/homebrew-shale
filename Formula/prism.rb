# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.12.0/prism-v0.12.0-darwin-amd64"
      sha256 "de0a44c0b2727b230c8d302c3259d6d8c033a8b6c1407d9f9abb8f9773d1a3f6"

      define_method(:install) do
        bin.install "prism-v0.12.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.12.0/prism-v0.12.0-darwin-arm64"
      sha256 "37a751a799e6b346fd5b3a0e4452ebb43c060675100f5b167406e113131ddb18"

      define_method(:install) do
        bin.install "prism-v0.12.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.12.0/prism-v0.12.0-linux-amd64"
      sha256 "c20fb30dc906e2c6935ab79f4d872f80aba74924cfb3b24ee9b56af0cdb5dbbd"
      define_method(:install) do
        bin.install "prism-v0.12.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.12.0/prism-v0.12.0-linux-arm64"
      sha256 "fe71a46ffabca532a248e8bfc66b16adfb9bca01ca82a017842f2bf7b9444172"
      define_method(:install) do
        bin.install "prism-v0.12.0-linux-arm64" => "prism"
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
