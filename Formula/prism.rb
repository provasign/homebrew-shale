# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.12/prism-v0.87.12-darwin-amd64"
      sha256 "fea5ed8d3782bffeb4653ac0f42f8ac27dc40ee98b4a048599ea12e4c6c2580a"

      define_method(:install) do
        bin.install "prism-v0.87.12-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.12/prism-v0.87.12-darwin-arm64"
      sha256 "e5a8d0c0762939a7c7a26099ed75047d7f733a6eb0a3379ad09e1a7280a7117c"

      define_method(:install) do
        bin.install "prism-v0.87.12-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.12/prism-v0.87.12-linux-amd64"
      sha256 "d1a40b44a7bad77c89f32aea18778f11845772cd5eb96fb54ab63efc676d5022"

      define_method(:install) do
        bin.install "prism-v0.87.12-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.12/prism-v0.87.12-linux-arm64"
      sha256 "48882e3743c4f6bc42258a426a1679289f49e61d49f69071d6f12d090bee0131"

      define_method(:install) do
        bin.install "prism-v0.87.12-linux-arm64" => "prism"
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
