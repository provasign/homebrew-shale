# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.7.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.7.3/mason-v0.7.3-darwin-amd64"
      sha256 "5b4548d6ff944e886f7e98a0b016d05a54f74004ad9f1cc27d75db1ff2ebd22a"

      define_method(:install) do
        bin.install "mason-v0.7.3-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.7.3/mason-v0.7.3-darwin-arm64"
      sha256 "1ed7d7da0cc698a8828a50ce1c8b8816a81e4c60f36a7f0241dda1a760148df4"

      define_method(:install) do
        bin.install "mason-v0.7.3-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.3/mason-v0.7.3-linux-amd64"
      sha256 "67735b2f54466832dc6806a20c50407e4446056d11ed7310b23ef72e360be972"
      define_method(:install) do
        bin.install "mason-v0.7.3-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.3/mason-v0.7.3-linux-arm64"
      sha256 "e51657de85fa7bc3cdf5c3edd6d36be2fda250b86ab12facf156ef2470c64a7f"
      define_method(:install) do
        bin.install "mason-v0.7.3-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
