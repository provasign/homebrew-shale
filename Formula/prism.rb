# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.57.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.57.0/prism-v0.57.0-darwin-amd64"
      sha256 "55a3682066cecf311550508a86544b6eb4aa67f9051099fecbb14496140138ac"

      define_method(:install) do
        bin.install "prism-v0.57.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.57.0/prism-v0.57.0-darwin-arm64"
      sha256 "aba7601c9f8b10fec0fa7fb215e55bbd77e1e58f888f23ba0d5d451e77ec94a5"

      define_method(:install) do
        bin.install "prism-v0.57.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.57.0/prism-v0.57.0-linux-amd64"
      sha256 "bfe0de38a666b59e5e2566903fcfdee062fd16798c6780742df8f43799cadb87"

      define_method(:install) do
        bin.install "prism-v0.57.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.57.0/prism-v0.57.0-linux-arm64"
      sha256 "28db67354209d7b1afe8e7064520067011cf744984c7360a9addfd9c205552a5"

      define_method(:install) do
        bin.install "prism-v0.57.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
