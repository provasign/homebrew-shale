# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.60.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.60.0/prism-v0.60.0-darwin-amd64"
      sha256 "17d9bd8b3b62dc55d7e6b36248907a261710710c8e056db58f15f98a8f2552f8"

      define_method(:install) do
        bin.install "prism-v0.60.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.60.0/prism-v0.60.0-darwin-arm64"
      sha256 "d75cc395a7f96f62b59fb2b89c34c3384ad24877776558695d868bc4aaa074c7"

      define_method(:install) do
        bin.install "prism-v0.60.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.60.0/prism-v0.60.0-linux-amd64"
      sha256 "37591ac02a7c3e3794c5dd334b468fbcf75945650362d986b5aa762e40adb0de"

      define_method(:install) do
        bin.install "prism-v0.60.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.60.0/prism-v0.60.0-linux-arm64"
      sha256 "7dc632826691616a7dfb77ed2dc9f48aa5f3d8e2a2a8f21646d2c0c242826d28"

      define_method(:install) do
        bin.install "prism-v0.60.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
