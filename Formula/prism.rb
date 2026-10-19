# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.33"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.33/prism-v0.87.33-darwin-amd64"
      sha256 "9004350c1ab55fc8051ded9da8fc910afcd436c70b9db2a2a89be8f59c54528b"

      define_method(:install) do
        bin.install "prism-v0.87.33-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.33/prism-v0.87.33-darwin-arm64"
      sha256 "7404a26ccd0963297c9a3f69fc68594bf2a158a27c712a2fa17cfa03ad95ff3d"

      define_method(:install) do
        bin.install "prism-v0.87.33-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.33/prism-v0.87.33-linux-amd64"
      sha256 "4ff5b0caa5a67ca070d00cdb0c103f5df97e687bd77df7427f34647ab6c24ec8"

      define_method(:install) do
        bin.install "prism-v0.87.33-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.33/prism-v0.87.33-linux-arm64"
      sha256 "f5da9edf386b846aec8420b58e45128a1bfa93e78910a71fb2fb4eca9b940c22"

      define_method(:install) do
        bin.install "prism-v0.87.33-linux-arm64" => "prism"
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
