# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.16/prism-v0.87.16-darwin-amd64"
      sha256 "57880156f3b5c229a30587c1dabd3d4d1646f57f25991cf1a367182882872253"

      define_method(:install) do
        bin.install "prism-v0.87.16-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.16/prism-v0.87.16-darwin-arm64"
      sha256 "fad17d8d8efc97349cb48e305266e6e929c4f9cce7a1dc0ea0007d02bbd69bc6"

      define_method(:install) do
        bin.install "prism-v0.87.16-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.16/prism-v0.87.16-linux-amd64"
      sha256 "a1855e6b72f45f9aed329a46f756e376fc2b8b755656514fec92f6c68ac804b6"

      define_method(:install) do
        bin.install "prism-v0.87.16-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.16/prism-v0.87.16-linux-arm64"
      sha256 "dfd06438ab1922704d7ad359b7787721db5067e7b91086750aaec7bae6b6c3d1"

      define_method(:install) do
        bin.install "prism-v0.87.16-linux-arm64" => "prism"
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
