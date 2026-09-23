# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.81.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.81.1/prism-v0.81.1-darwin-amd64"
      sha256 "e9ecb3ef3aa9504b70c868a6b6d876dfb8e9f32313b8a8dea49d1cf47a957af2"

      define_method(:install) do
        bin.install "prism-v0.81.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.81.1/prism-v0.81.1-darwin-arm64"
      sha256 "d10f19ae174f1c3f5bf73178320e3087fe3536193a9d0349a23c70a464d36292"

      define_method(:install) do
        bin.install "prism-v0.81.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.81.1/prism-v0.81.1-linux-amd64"
      sha256 "f5e309dab3fe3ea6f42d98c7e4de371f94d375ca19e803812df2583d5b42e7a3"

      define_method(:install) do
        bin.install "prism-v0.81.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.81.1/prism-v0.81.1-linux-arm64"
      sha256 "a1e2155c8ddfe46c98e03adf38719ec80c43f480ab6030ead96b9ceb62451755"

      define_method(:install) do
        bin.install "prism-v0.81.1-linux-arm64" => "prism"
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
