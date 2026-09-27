# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.84.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.84.4/prism-v0.84.4-darwin-amd64"
      sha256 "812931837e15be5f34a1a55e5858a8f642191e0c292918c987c873694c0e823b"

      define_method(:install) do
        bin.install "prism-v0.84.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.84.4/prism-v0.84.4-darwin-arm64"
      sha256 "ef407135f9d6450f50ca7601d0932e99ca2e5f31ca1cf1f27e36bd023b40f715"

      define_method(:install) do
        bin.install "prism-v0.84.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.4/prism-v0.84.4-linux-amd64"
      sha256 "017300d32db0d7e3b50d1214bae23554117ab72a76e82e99bc66517b6e63cf4c"

      define_method(:install) do
        bin.install "prism-v0.84.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.4/prism-v0.84.4-linux-arm64"
      sha256 "f6f0fd623a242a19dc5a5a50ae309f2bf075972d3233c2f8a305e0249140100a"

      define_method(:install) do
        bin.install "prism-v0.84.4-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Run `prism init` inside each project after installing or upgrading to
      configure supported AI clients. Prism setup is project-scoped;
      `prism init --global` is no longer supported.

      Restart or reload running AI clients after upgrading Prism.

      Prism reports other installed copies when their versions differ.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
