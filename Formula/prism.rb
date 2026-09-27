# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.84.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.84.2/prism-v0.84.2-darwin-amd64"
      sha256 "0b81fd281402bb510390e41220e1cb0869b6fb38ce766bee2064d4d330df2400"

      define_method(:install) do
        bin.install "prism-v0.84.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.84.2/prism-v0.84.2-darwin-arm64"
      sha256 "51a05759528e01458f73c908583c3a324b100f6cdba6105e9d97d55b120e568a"

      define_method(:install) do
        bin.install "prism-v0.84.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.2/prism-v0.84.2-linux-amd64"
      sha256 "e2e2066bbec79c82d4a837788efc0c1a2475eb5d6c4f76848ed0902f9680534a"

      define_method(:install) do
        bin.install "prism-v0.84.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.84.2/prism-v0.84.2-linux-arm64"
      sha256 "74ecde029e18643fe8afb87021cc2efae1b8007a596d0151031846c41bd71509"

      define_method(:install) do
        bin.install "prism-v0.84.2-linux-arm64" => "prism"
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
