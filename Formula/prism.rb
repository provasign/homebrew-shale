# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.4/prism-v0.72.4-darwin-amd64"
      sha256 "bc8176172fdb48e873ded183342f3b5726b532f23f7cf7b23481149ca98fdd8f"

      define_method(:install) do
        bin.install "prism-v0.72.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.4/prism-v0.72.4-darwin-arm64"
      sha256 "a84e792dd638cd2efbe5e998fe7473039eb7db2da0a3e3d34a560bac44072fa9"

      define_method(:install) do
        bin.install "prism-v0.72.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.4/prism-v0.72.4-linux-amd64"
      sha256 "49ea21aecf22567fb960db0fcf43190581feee4de68f40b282f26f5128d35eb4"

      define_method(:install) do
        bin.install "prism-v0.72.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.4/prism-v0.72.4-linux-arm64"
      sha256 "16bfe293d8d1fc71e98a45842d38e16749d4f98c6cc2e1d14727820253731592"

      define_method(:install) do
        bin.install "prism-v0.72.4-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
