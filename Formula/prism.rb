# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.4/prism-v0.85.4-darwin-amd64"
      sha256 "98b056bcddf4bbce2e01f430b3770fd196ccd31bf42aef85d9fb2f6ca82566af"

      define_method(:install) do
        bin.install "prism-v0.85.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.4/prism-v0.85.4-darwin-arm64"
      sha256 "059db86c4ef815460c5177a09dff33212c0d773a6b8c7a8a6cf64cb66f35bb8d"

      define_method(:install) do
        bin.install "prism-v0.85.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.4/prism-v0.85.4-linux-amd64"
      sha256 "20cbf27419e1292205fdf264eb778572e350f95611bde970ece2d6e45fe134e4"

      define_method(:install) do
        bin.install "prism-v0.85.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.4/prism-v0.85.4-linux-arm64"
      sha256 "6cc02793233c64d214550d750d59a93b5d9c6b435dca2c1a2a4a7a4e7461e66d"

      define_method(:install) do
        bin.install "prism-v0.85.4-linux-arm64" => "prism"
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
