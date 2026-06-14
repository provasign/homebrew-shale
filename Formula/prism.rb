# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.13.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.13.1/prism-v0.13.1-darwin-amd64"
      sha256 "87d1be082c7e3c9fa778ce09d56c14f05b310551760cc99800ee180efab7c302"

      define_method(:install) do
        bin.install "prism-v0.13.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.13.1/prism-v0.13.1-darwin-arm64"
      sha256 "e5d5fb624d2d2ec0246881906290b95b34c3764c7b0003b0d96cc7c0bf89ed36"

      define_method(:install) do
        bin.install "prism-v0.13.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.13.1/prism-v0.13.1-linux-amd64"
      sha256 "a9a8fb92bb4bf6f0c9bee46510f0722817a83bdc4dda8a56c7469cc54a0785ee"
      define_method(:install) do
        bin.install "prism-v0.13.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.13.1/prism-v0.13.1-linux-arm64"
      sha256 "abf6ad7b47d28c6d5f4b54a6cfdf4b158d8a21f818ac134eb08e45b8be6d704c"
      define_method(:install) do
        bin.install "prism-v0.13.1-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Register Prism with your AI tools from a project root:
        prism init . --mode both
    EOS
  end

  test do
    system "#{bin}/prism", "version"
  end
end
