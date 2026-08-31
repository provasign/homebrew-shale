# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.64.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.64.0/prism-v0.64.0-darwin-amd64"
      sha256 "240242b3ce907036b329b60cd3ca98dd76f7e912d1595391138164eefc33f242"

      define_method(:install) do
        bin.install "prism-v0.64.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.64.0/prism-v0.64.0-darwin-arm64"
      sha256 "42589c558fbde2264c22f89a77af434723aad12fdc23da12feb412cf45d45936"

      define_method(:install) do
        bin.install "prism-v0.64.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.64.0/prism-v0.64.0-linux-amd64"
      sha256 "ba1cf04bfec76c2b7ab75573e6b244987ab4385eef1c25597cb30c75cf12aec8"

      define_method(:install) do
        bin.install "prism-v0.64.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.64.0/prism-v0.64.0-linux-arm64"
      sha256 "8e2705b6735159d72ed4662febf7cb0586ae1903692cd4d7290930b8cd681bef"

      define_method(:install) do
        bin.install "prism-v0.64.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
