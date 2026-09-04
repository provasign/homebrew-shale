# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.69.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.69.1/prism-v0.69.1-darwin-amd64"
      sha256 "bb926dc64fdb1d8ca49477744335bb89d1776f1db8281cf4f135c31f2608cd38"

      define_method(:install) do
        bin.install "prism-v0.69.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.69.1/prism-v0.69.1-darwin-arm64"
      sha256 "130595ce36a75a04a8d17a247e65b7ceca98033a558dbefeeeef2e448284f4b8"

      define_method(:install) do
        bin.install "prism-v0.69.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.69.1/prism-v0.69.1-linux-amd64"
      sha256 "642e35c37748ff49958a0a39381a5abdc84933c8acf17d68e4b94e05256054c5"

      define_method(:install) do
        bin.install "prism-v0.69.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.69.1/prism-v0.69.1-linux-arm64"
      sha256 "922ab85c44970e107af6b787554d5238f8aa1229deba667d7526997f4e8368f5"

      define_method(:install) do
        bin.install "prism-v0.69.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
