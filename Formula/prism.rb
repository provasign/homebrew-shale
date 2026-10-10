# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.6/prism-v0.86.6-darwin-amd64"
      sha256 "4b5be4b6f5ea53ccfbc7f32708a446a5d958c7d1afb321faeb1c0d5e92ca944d"

      define_method(:install) do
        bin.install "prism-v0.86.6-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.6/prism-v0.86.6-darwin-arm64"
      sha256 "baac5bfedeb9238080d230311ca29b79578203733dbdafb8334529d80497ed02"

      define_method(:install) do
        bin.install "prism-v0.86.6-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.6/prism-v0.86.6-linux-amd64"
      sha256 "a96fde75df906c741e511c002ff6a0484fae84358b2dddca3ad45185c0bb756a"

      define_method(:install) do
        bin.install "prism-v0.86.6-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.6/prism-v0.86.6-linux-arm64"
      sha256 "d5e8c8e3ad1711e3bcd3d7e416eddac445568b701843e321126dead9858c2181"

      define_method(:install) do
        bin.install "prism-v0.86.6-linux-arm64" => "prism"
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
