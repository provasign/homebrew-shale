# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.18/prism-v0.87.18-darwin-amd64"
      sha256 "61f7363835506bed4fb5328ef7880e902e2b3d32e97cabdb18cfb22f9c95dfdd"

      define_method(:install) do
        bin.install "prism-v0.87.18-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.18/prism-v0.87.18-darwin-arm64"
      sha256 "b8ea6f8e5babe69f30093bbd2f58ae1b891034a0ba48b60f31b7491cd4c2ad4a"

      define_method(:install) do
        bin.install "prism-v0.87.18-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.18/prism-v0.87.18-linux-amd64"
      sha256 "890c208cfa9848228949b6c98f4e4f148a2ab5ea3ac59744e6c1ebca95840f7a"

      define_method(:install) do
        bin.install "prism-v0.87.18-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.18/prism-v0.87.18-linux-arm64"
      sha256 "7f9df95e4b58744cdb3c88d6bc6fae1af9fb0fa5f8876cd285f192f44b68a189"

      define_method(:install) do
        bin.install "prism-v0.87.18-linux-arm64" => "prism"
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
