# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.6/prism-v0.85.6-darwin-amd64"
      sha256 "105ebb06d1738390d1e2b69254960e71e3e580a91025de2ce8c996ed2477a33f"

      define_method(:install) do
        bin.install "prism-v0.85.6-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.6/prism-v0.85.6-darwin-arm64"
      sha256 "dfddd2ffaa1a5173770395cf3a954c0df437bc8f1437a218b8054fc2196474a3"

      define_method(:install) do
        bin.install "prism-v0.85.6-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.6/prism-v0.85.6-linux-amd64"
      sha256 "b6066754dd0f056c4d6d786f2acf6fc6a69f1eef246b74ff1cda79d6d5ae33d0"

      define_method(:install) do
        bin.install "prism-v0.85.6-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.6/prism-v0.85.6-linux-arm64"
      sha256 "ca46e0891bc4a2ce63311e8eb1ac4437443c250cfe7423c0da1918dc94b70298"

      define_method(:install) do
        bin.install "prism-v0.85.6-linux-arm64" => "prism"
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
