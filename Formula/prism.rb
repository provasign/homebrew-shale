# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.0/prism-v0.85.0-darwin-amd64"
      sha256 "ea8e184df37793a834ef2a59665652c245f5dc4277f075fdee90196aad8e8f8e"

      define_method(:install) do
        bin.install "prism-v0.85.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.0/prism-v0.85.0-darwin-arm64"
      sha256 "1f3a6dc2635843d4953513156d9718f4ac6e77774e477079008bbb9e213641c3"

      define_method(:install) do
        bin.install "prism-v0.85.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.0/prism-v0.85.0-linux-amd64"
      sha256 "1f2ab4f13e44dc9c6e2f4f2b11ac20df41acbba4705d56f044ca987c31cb374a"

      define_method(:install) do
        bin.install "prism-v0.85.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.0/prism-v0.85.0-linux-arm64"
      sha256 "809897602a4e21b527c1b353e4b6ed5201570e1e533ebdf19f9def97211567a2"

      define_method(:install) do
        bin.install "prism-v0.85.0-linux-arm64" => "prism"
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
