# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.82.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.82.2/prism-v0.82.2-darwin-amd64"
      sha256 "02f1737cbc6b7614a17237e996d6e693818800d72696f8db17e6f8939345a66b"

      define_method(:install) do
        bin.install "prism-v0.82.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.82.2/prism-v0.82.2-darwin-arm64"
      sha256 "841a55e5259d6fcb061ffc94e1a93092aaae9949a33bfb8739b4e5c1bd598f95"

      define_method(:install) do
        bin.install "prism-v0.82.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.82.2/prism-v0.82.2-linux-amd64"
      sha256 "c2d32bc4ab46aef2d774eb2ee6d5619273b5fdaf214233490e1b55eabe0d39a4"

      define_method(:install) do
        bin.install "prism-v0.82.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.82.2/prism-v0.82.2-linux-arm64"
      sha256 "ccc8986faee5c8cfec4c1c9cee6f6858cd91fa78a13c149c14c02895c931e350"

      define_method(:install) do
        bin.install "prism-v0.82.2-linux-arm64" => "prism"
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
