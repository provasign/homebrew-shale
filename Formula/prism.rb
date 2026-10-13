# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.20"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.20/prism-v0.87.20-darwin-amd64"
      sha256 "b9e11f3a1bb89815c4923368ca870f80e7efaa1c5e513027650c71bef1dda6dd"

      define_method(:install) do
        bin.install "prism-v0.87.20-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.20/prism-v0.87.20-darwin-arm64"
      sha256 "90ac293d9d121cbe8136601e3b161f64e8fe72eb805487929233001f473592a9"

      define_method(:install) do
        bin.install "prism-v0.87.20-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.20/prism-v0.87.20-linux-amd64"
      sha256 "5628d0d58152c7e0f924721a3dce6d8062c035eba50c057a011496cd9968496e"

      define_method(:install) do
        bin.install "prism-v0.87.20-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.20/prism-v0.87.20-linux-arm64"
      sha256 "91c10715b4439ba33e74531548cb1513f1cac79a505d9f4d07c75974dc9e4274"

      define_method(:install) do
        bin.install "prism-v0.87.20-linux-arm64" => "prism"
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
