# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.44.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.44.1/prism-v0.44.1-darwin-amd64"
      sha256 "a6a19e190d69ab9dd24357a7296ea383e01fe34cef46d970a4bb13b8b86715b9"

      define_method(:install) do
        bin.install "prism-v0.44.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.44.1/prism-v0.44.1-darwin-arm64"
      sha256 "4df2f4fe0303538cf0b28fcc6cf61e9805e6772a13e8ef57c056b7f9824fa5a1"

      define_method(:install) do
        bin.install "prism-v0.44.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.44.1/prism-v0.44.1-linux-amd64"
      sha256 "f054c5e5d23a19cdada59b8d7a5f3d35eac7d66f47c0a475dee4eb599067d1d2"

      define_method(:install) do
        bin.install "prism-v0.44.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.44.1/prism-v0.44.1-linux-arm64"
      sha256 "d57dd9de0606dae5fe38ad2dcfe04d9bdc43162bb49e08e8be2f90cf6eb43f7b"

      define_method(:install) do
        bin.install "prism-v0.44.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
