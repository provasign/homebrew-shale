# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.11/prism-v0.55.11-darwin-amd64"
      sha256 "4b9dfaffb288d5f44499ae3bc0be6a60f4a09acdb57adedc726ea4ad2086c256"

      define_method(:install) do
        bin.install "prism-v0.55.11-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.11/prism-v0.55.11-darwin-arm64"
      sha256 "ede5b2c18f90d27ca17ae68c20fb697c91299eac37e022ab188baeacd195dbd9"

      define_method(:install) do
        bin.install "prism-v0.55.11-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.11/prism-v0.55.11-linux-amd64"
      sha256 "e1ea59a21b05e3e8d0e7eeb6ccc180d6bb9c1fde278e17045c1aef16607c5a5d"

      define_method(:install) do
        bin.install "prism-v0.55.11-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.11/prism-v0.55.11-linux-arm64"
      sha256 "b18693ccbfed1a5e892a738728e5b27ccab239e780d1fdf40e404afc3e10dfb3"

      define_method(:install) do
        bin.install "prism-v0.55.11-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
