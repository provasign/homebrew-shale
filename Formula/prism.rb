# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.82.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.82.0/prism-v0.82.0-darwin-amd64"
      sha256 "98db8ce560618dcac575a17c8c3366f8f9f79eba7be34baab4e9477dc7819efd"

      define_method(:install) do
        bin.install "prism-v0.82.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.82.0/prism-v0.82.0-darwin-arm64"
      sha256 "72c9550937a96addca883cdd9a3bf2b9fd0b52a1f1725d1b594beb1ad53d293c"

      define_method(:install) do
        bin.install "prism-v0.82.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.82.0/prism-v0.82.0-linux-amd64"
      sha256 "48acf675f0b33f34db85f7c1fed52b36be282b741ebe9b3f62b9ea3fe49912dd"

      define_method(:install) do
        bin.install "prism-v0.82.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.82.0/prism-v0.82.0-linux-arm64"
      sha256 "1f00416315a3aa23255c51c4ccba3cfe0ea44ecdd8d6c9e5f8cede6e65c14b0d"

      define_method(:install) do
        bin.install "prism-v0.82.0-linux-arm64" => "prism"
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
