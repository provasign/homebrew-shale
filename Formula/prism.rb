# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.0/prism-v0.86.0-darwin-amd64"
      sha256 "f4b7612f4cd381d31bc2c86810f6064eccf7d7013db477a69d06f97fdd340961"

      define_method(:install) do
        bin.install "prism-v0.86.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.0/prism-v0.86.0-darwin-arm64"
      sha256 "0f8ba61c07ea9c63a7fcf0bd0ace98ba107545c375d62ef2833b703358077383"

      define_method(:install) do
        bin.install "prism-v0.86.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.0/prism-v0.86.0-linux-amd64"
      sha256 "6e4292ce74c427af9264f3c3777e3f642ae2d95af866811a4a8e0279b5e19cf5"

      define_method(:install) do
        bin.install "prism-v0.86.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.0/prism-v0.86.0-linux-arm64"
      sha256 "4411625bc6b301c72b2a29e61a159bd5d9b96b5f5aa19c881d758ca060064823"

      define_method(:install) do
        bin.install "prism-v0.86.0-linux-arm64" => "prism"
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
