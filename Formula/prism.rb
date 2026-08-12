# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.46.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.46.0/prism-v0.46.0-darwin-amd64"
      sha256 "c4f1d96741e6897b30036396837cb894a4d47a5b9a0e41589f7d6ad739f10515"

      define_method(:install) do
        bin.install "prism-v0.46.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.46.0/prism-v0.46.0-darwin-arm64"
      sha256 "eec4531e42a22bfe152987e5df5af8c759a2711bc8250687a131fbbd954eb4dc"

      define_method(:install) do
        bin.install "prism-v0.46.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.46.0/prism-v0.46.0-linux-amd64"
      sha256 "9c151a1a70ec110ed5bdbd8d790e1a9cd0eadfcb0f910fc538df4a60fcffd61e"

      define_method(:install) do
        bin.install "prism-v0.46.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.46.0/prism-v0.46.0-linux-arm64"
      sha256 "ac32edd9e3b824c6358cb696071af0e85b13254bc34aa8bb9aa0af1dff07f51e"

      define_method(:install) do
        bin.install "prism-v0.46.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
