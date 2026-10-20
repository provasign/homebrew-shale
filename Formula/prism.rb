# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.35"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.35/prism-v0.87.35-darwin-amd64"
      sha256 "705b128ec1c0171c87137e7dd0b7be0783242225f058b6c323b8e3335787d1b9"

      define_method(:install) do
        bin.install "prism-v0.87.35-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.35/prism-v0.87.35-darwin-arm64"
      sha256 "aef19d32d5de440a63b3a6437a8a729d99a0542a2e7be9382cac29435e9ab3c6"

      define_method(:install) do
        bin.install "prism-v0.87.35-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.35/prism-v0.87.35-linux-amd64"
      sha256 "cad8402ef06435e440b0d5ed740ecceb6745f972809ab65f00b4e2caa355d081"

      define_method(:install) do
        bin.install "prism-v0.87.35-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.35/prism-v0.87.35-linux-arm64"
      sha256 "c8174e1b01c9687b042755cc78451bca9ce1d390d3b46e93f62073f697613dbe"

      define_method(:install) do
        bin.install "prism-v0.87.35-linux-arm64" => "prism"
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
