# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.7/prism-v0.55.7-darwin-amd64"
      sha256 "2f711b625d49b46146d2cbdb0f647a33bd812b7ccb7456eb60609e48c4973cd5"

      define_method(:install) do
        bin.install "prism-v0.55.7-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.7/prism-v0.55.7-darwin-arm64"
      sha256 "c407950a2378602c484abab750c541070c1a93dac8e01fcb80434cce4aeccc73"

      define_method(:install) do
        bin.install "prism-v0.55.7-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.7/prism-v0.55.7-linux-amd64"
      sha256 "687cb0694a240fc6be90a5fd47cc93a2e626cc79c9e0be6605d97f5f241eeac3"

      define_method(:install) do
        bin.install "prism-v0.55.7-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.7/prism-v0.55.7-linux-arm64"
      sha256 "3148b3f27bae39eceea4f1d040170ea6242155bd4d2c014cdd464bd49a97ffc4"

      define_method(:install) do
        bin.install "prism-v0.55.7-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
