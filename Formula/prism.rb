# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.8/prism-v0.86.8-darwin-amd64"
      sha256 "0069894a681b98ba1043cdeacfcd11cf4afb848afa24e283b4b3a4f14e622bd4"

      define_method(:install) do
        bin.install "prism-v0.86.8-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.8/prism-v0.86.8-darwin-arm64"
      sha256 "a84d821f8647c15dc7f454ea96ea668457ceafab2294f941d6f09a5af8551b68"

      define_method(:install) do
        bin.install "prism-v0.86.8-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.8/prism-v0.86.8-linux-amd64"
      sha256 "36ea8686d1e43cd26ee79ed0985ed9a3070743d6ba20d729088497a9b528f7dc"

      define_method(:install) do
        bin.install "prism-v0.86.8-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.8/prism-v0.86.8-linux-arm64"
      sha256 "2567a12fc5679a1429895b30339076b7c664c86a63740e155ab3b565bfff856d"

      define_method(:install) do
        bin.install "prism-v0.86.8-linux-arm64" => "prism"
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
