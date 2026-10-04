# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.9/prism-v0.85.9-darwin-amd64"
      sha256 "79f8facc035d0ff5d8c53344625d1fa272479c902c662c1474c68a3ef3f719db"

      define_method(:install) do
        bin.install "prism-v0.85.9-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.9/prism-v0.85.9-darwin-arm64"
      sha256 "95694d010816b85c487774ab7999cdc400d48c176e711b63cc5cbb8ba9cf5230"

      define_method(:install) do
        bin.install "prism-v0.85.9-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.9/prism-v0.85.9-linux-amd64"
      sha256 "c4951d2ebb8be1fcdfd00f14f1f66f1c751e1d5dd8e2bafdc1a114ccf0f322f5"

      define_method(:install) do
        bin.install "prism-v0.85.9-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.9/prism-v0.85.9-linux-arm64"
      sha256 "225a9d043fd9f9fafb959dd9e98e48a6309c8616b35a55350e652456d52ed4f2"

      define_method(:install) do
        bin.install "prism-v0.85.9-linux-arm64" => "prism"
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
