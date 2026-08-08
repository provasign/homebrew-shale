# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.38.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.38.1/prism-v0.38.1-darwin-amd64"
      sha256 "095bdf007bbf944a424f1b7572980bffd84376134bde5e4a7f809c38dd6d8b52"

      define_method(:install) do
        bin.install "prism-v0.38.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.38.1/prism-v0.38.1-darwin-arm64"
      sha256 "95b21de47630a977ccae3c9f3e1574f5590b965c7f4624d0459b79303d005914"

      define_method(:install) do
        bin.install "prism-v0.38.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.38.1/prism-v0.38.1-linux-amd64"
      sha256 "df9efdc856695e91c83d701830411e35a40ebf2aa0b39a8840ac77df35e42998"

      define_method(:install) do
        bin.install "prism-v0.38.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.38.1/prism-v0.38.1-linux-arm64"
      sha256 "fedab2cbcecc6e0976cb31c79eadc9e8c5f1ca36ddc53fa8bd3d5ce17f5112ca"

      define_method(:install) do
        bin.install "prism-v0.38.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
