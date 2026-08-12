# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.49.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.49.0/prism-v0.49.0-darwin-amd64"
      sha256 "2c869bf33b1d09e77edbf0567e2d26b1ca6a8bca72e2952916b177252b8beefa"

      define_method(:install) do
        bin.install "prism-v0.49.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.49.0/prism-v0.49.0-darwin-arm64"
      sha256 "ba38dc3c883a9715185eaffa7a90e192009b58b5d6588ad417b05c8f49a037fb"

      define_method(:install) do
        bin.install "prism-v0.49.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.49.0/prism-v0.49.0-linux-amd64"
      sha256 "ae68d8d374b14a8049994a93e5bab1dd623377eed458e72a90d05c2a63b15550"

      define_method(:install) do
        bin.install "prism-v0.49.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.49.0/prism-v0.49.0-linux-arm64"
      sha256 "9afbeeeed603f3cf03b3b08fec644bebf0813d793618edc84e7d7aa77a3b5cbd"

      define_method(:install) do
        bin.install "prism-v0.49.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
