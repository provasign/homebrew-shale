# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.8/prism-v0.87.8-darwin-amd64"
      sha256 "2054da69f79122c0d93f135a06aa35aed20eaab4f2dc3ff2b52b4c9313b88318"

      define_method(:install) do
        bin.install "prism-v0.87.8-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.8/prism-v0.87.8-darwin-arm64"
      sha256 "9ee7231e332fb334f45ca988712214859f33ca9f2a751cc504025cc29595373e"

      define_method(:install) do
        bin.install "prism-v0.87.8-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.8/prism-v0.87.8-linux-amd64"
      sha256 "7e8b9aff142f2a9ce3be72ff4126f1af31b9a9d74bc248b2eaf8a6582ccdb430"

      define_method(:install) do
        bin.install "prism-v0.87.8-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.8/prism-v0.87.8-linux-arm64"
      sha256 "b86bcb8350c996a9391d04ea343685adc4697ef55c9e421ee8321d5ec5e60c20"

      define_method(:install) do
        bin.install "prism-v0.87.8-linux-arm64" => "prism"
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
