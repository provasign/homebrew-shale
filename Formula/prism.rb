# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.75.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.75.2/prism-v0.75.2-darwin-amd64"
      sha256 "ea0189ea2a9c1f0cd3fca07122e55b5e9b773447c6fd15754729174de0771632"

      define_method(:install) do
        bin.install "prism-v0.75.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.75.2/prism-v0.75.2-darwin-arm64"
      sha256 "9d7d783128f6f96ff81ebc54a1b3acfe0788e7b002d47bed7471038657cf1a2d"

      define_method(:install) do
        bin.install "prism-v0.75.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.75.2/prism-v0.75.2-linux-amd64"
      sha256 "8e3a9f1436b9d9a142ad6c8ebbd3cb79741a04c77f1f66fb9ddf908217cfc150"

      define_method(:install) do
        bin.install "prism-v0.75.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.75.2/prism-v0.75.2-linux-arm64"
      sha256 "c1cfbe800daa1fd191e79bad23c686b52065fba3df1aae26b2ce8b732b2371ac"

      define_method(:install) do
        bin.install "prism-v0.75.2-linux-arm64" => "prism"
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
