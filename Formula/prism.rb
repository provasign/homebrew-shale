# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.17.0/prism-v0.17.0-darwin-amd64"
      sha256 "e47ce513118c39f9a88ec1cd2b7f250edfcf7b2f1e30e52deeb5d952607de451"

      define_method(:install) do
        bin.install "prism-v0.17.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.17.0/prism-v0.17.0-darwin-arm64"
      sha256 "dd8c531f3dbe7f0cad9f2a629419a5e255a3f1e245a469c3c35d35bc3d7c1874"

      define_method(:install) do
        bin.install "prism-v0.17.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.17.0/prism-v0.17.0-linux-amd64"
      sha256 "45469a75207e38016a6a2ed4762bacbcfc413ffc1cd597320c144a28e335e4cf"
      define_method(:install) do
        bin.install "prism-v0.17.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.17.0/prism-v0.17.0-linux-arm64"
      sha256 "c26094c99ee09a120473d532acfe23a222f0cd501d5b4f1003d7a506a41b03a7"
      define_method(:install) do
        bin.install "prism-v0.17.0-linux-arm64" => "prism"
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
