# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.67.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.67.0/prism-v0.67.0-darwin-amd64"
      sha256 "b8dbaebd4eb3d4860de3c402281bdb854f759e2585c8d18495da392821f7802d"

      define_method(:install) do
        bin.install "prism-v0.67.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.67.0/prism-v0.67.0-darwin-arm64"
      sha256 "62a1324668741e0046339dfd2f93618544e41969e9bf7c8ecf426389c86c472d"

      define_method(:install) do
        bin.install "prism-v0.67.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.67.0/prism-v0.67.0-linux-amd64"
      sha256 "12ddbca263facc9220ce979b7a095d9915f9ef66453bc19fb26b15fb360bbe43"

      define_method(:install) do
        bin.install "prism-v0.67.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.67.0/prism-v0.67.0-linux-arm64"
      sha256 "62fd61e755d3d478adb60a11d5033166f8a2759495e223d16472099f4b84d473"

      define_method(:install) do
        bin.install "prism-v0.67.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
