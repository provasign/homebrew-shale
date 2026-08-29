# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.5/prism-v0.56.5-darwin-amd64"
      sha256 "e919d0c26dfd0040683fb80f0413d7ee422271da420817acdc682f8e747ff2b4"

      define_method(:install) do
        bin.install "prism-v0.56.5-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.5/prism-v0.56.5-darwin-arm64"
      sha256 "0c924c8e13e239d18ef3d01220b27ef678f8449afe0c409f1fdd1ed6490a9b57"

      define_method(:install) do
        bin.install "prism-v0.56.5-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.5/prism-v0.56.5-linux-amd64"
      sha256 "29dd1977dadd014ac06deffaac6c41c3c6a263af9589de23158f83fa3c0278ed"

      define_method(:install) do
        bin.install "prism-v0.56.5-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.5/prism-v0.56.5-linux-arm64"
      sha256 "40d74cb922c732c8fe58cd950935b91d92f50ddf6b34b52e914463410546d3fb"

      define_method(:install) do
        bin.install "prism-v0.56.5-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
