# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.71.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.71.0/prism-v0.71.0-darwin-amd64"
      sha256 "e3f09c4b2feca05fcd0425e052e4e544a2ffce9ee3e81d63adb7f72ae16c8b5b"

      define_method(:install) do
        bin.install "prism-v0.71.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.71.0/prism-v0.71.0-darwin-arm64"
      sha256 "2c1975b9f9c17716837f1ca33c0b1ee258c15cf8d864b367ebea20aca063d9e8"

      define_method(:install) do
        bin.install "prism-v0.71.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.71.0/prism-v0.71.0-linux-amd64"
      sha256 "8920b827444ae7c0d838a7fbbbbfed10427832f2bcc461093ccb8f49dbabb256"

      define_method(:install) do
        bin.install "prism-v0.71.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.71.0/prism-v0.71.0-linux-arm64"
      sha256 "fe18651af2718b7a31845f76c76d24a5e40cd731742ac0eb7e3ba15a13bea964"

      define_method(:install) do
        bin.install "prism-v0.71.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
