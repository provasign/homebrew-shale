# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.41.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.41.2/prism-v0.41.2-darwin-amd64"
      sha256 "c2aeff4301bc75b1bf31635f7b9b48d7c4512c227d27f5edcf9d91d91afc704d"

      define_method(:install) do
        bin.install "prism-v0.41.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.41.2/prism-v0.41.2-darwin-arm64"
      sha256 "216178ff212a1163603bc99b4a9dece6aa16702bf4b8c5ad21b86224a692e0f7"

      define_method(:install) do
        bin.install "prism-v0.41.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.41.2/prism-v0.41.2-linux-amd64"
      sha256 "94e96c3a8cc42e7eef5c857653ba692eea982e297c2fd5264d4188c1c69591a3"

      define_method(:install) do
        bin.install "prism-v0.41.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.41.2/prism-v0.41.2-linux-arm64"
      sha256 "d38b404aa7f398da653e2df14157e297407c13b284ac0c7ea34684776798d60e"

      define_method(:install) do
        bin.install "prism-v0.41.2-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
