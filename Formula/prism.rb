# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.19/prism-v0.87.19-darwin-amd64"
      sha256 "17626d83a04cace6acddadeb213a05457c208b8a3fd25251e8fb5fc94cb1ab85"

      define_method(:install) do
        bin.install "prism-v0.87.19-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.19/prism-v0.87.19-darwin-arm64"
      sha256 "f4236963e63e1736ffb095459c8986e1e648629899aa96ac00b8addf94f2f696"

      define_method(:install) do
        bin.install "prism-v0.87.19-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.19/prism-v0.87.19-linux-amd64"
      sha256 "8482debc44d931cc197ac0fee694f2dfe09d1dade1c88b5c2ca4e2f3fad8b7dc"

      define_method(:install) do
        bin.install "prism-v0.87.19-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.19/prism-v0.87.19-linux-arm64"
      sha256 "a17f4339ed31cea943996008e3d2cb54df14e6d113e0fa7aa962abcb9bd81970"

      define_method(:install) do
        bin.install "prism-v0.87.19-linux-arm64" => "prism"
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
