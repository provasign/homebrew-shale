# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.3/prism-v0.56.3-darwin-amd64"
      sha256 "0157e6128b7e447da5674f27c73a4d38229a42b256833dd40ee4c16fe5ba95c0"

      define_method(:install) do
        bin.install "prism-v0.56.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.3/prism-v0.56.3-darwin-arm64"
      sha256 "730d0e56960dbc2c90318478db204bf2d153945dde705ba1a3e0648a4a909d2a"

      define_method(:install) do
        bin.install "prism-v0.56.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.3/prism-v0.56.3-linux-amd64"
      sha256 "41eb3c00d846557b57412842a688311683253cfe47bb747a606de30f3b987cef"

      define_method(:install) do
        bin.install "prism-v0.56.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.3/prism-v0.56.3-linux-arm64"
      sha256 "46f2d9d8ee5eda405b04062e06b00b44a406c7470c35fce0be70f201fc463d58"

      define_method(:install) do
        bin.install "prism-v0.56.3-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
