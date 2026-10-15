# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.25/prism-v0.87.25-darwin-amd64"
      sha256 "c91784ca80da7c7da3f7571f4f3b716a9cea3aa4630ce085a40c24779f0a1c0c"

      define_method(:install) do
        bin.install "prism-v0.87.25-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.25/prism-v0.87.25-darwin-arm64"
      sha256 "c04731b0309ae498903b167e50c1ed02fdc07ce0c553bf1343622c508f11c3c5"

      define_method(:install) do
        bin.install "prism-v0.87.25-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.25/prism-v0.87.25-linux-amd64"
      sha256 "d32dc9a1df37b0c85d7d4a187ec549f845539d57d7b7f68049abc4e83e277182"

      define_method(:install) do
        bin.install "prism-v0.87.25-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.25/prism-v0.87.25-linux-arm64"
      sha256 "5693cc22d325e898c4c84505433c07d703e6a23d449e0322ee86f93b9ea78c6a"

      define_method(:install) do
        bin.install "prism-v0.87.25-linux-arm64" => "prism"
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
