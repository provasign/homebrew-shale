# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.84.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.84.1/prism-v0.84.1-darwin-amd64"
      sha256 "10876d61bb62f4d7a866e1920d3923fb3544dd911ce59e1fbdce6c16f244c827"

      define_method(:install) do
        bin.install "prism-v0.84.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.84.1/prism-v0.84.1-darwin-arm64"
      sha256 "4f8ef31fc53bb4aa37980b85e5401d89ab2a149f0b1fd77d161395cc1887a71f"

      define_method(:install) do
        bin.install "prism-v0.84.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.1/prism-v0.84.1-linux-amd64"
      sha256 "bd8bce1264444127c0a9bdde6615ea612b78b052812988a52dfdc5728d548f86"

      define_method(:install) do
        bin.install "prism-v0.84.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.1/prism-v0.84.1-linux-arm64"
      sha256 "5c080ce6c96290aef7a8c34015f3e14a502bb98c0f6dca66b0b0337b366d1220"

      define_method(:install) do
        bin.install "prism-v0.84.1-linux-arm64" => "prism"
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
