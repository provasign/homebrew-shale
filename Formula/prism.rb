# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.23"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.23/prism-v0.87.23-darwin-amd64"
      sha256 "5c3875c92e0932afba56699eb8de7e139d6f93952e112350ea982737ef4cdde3"

      define_method(:install) do
        bin.install "prism-v0.87.23-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.23/prism-v0.87.23-darwin-arm64"
      sha256 "fe040a8938c36408321fb29bd373623b04a365ff7f79213c3c75a31c9b437df9"

      define_method(:install) do
        bin.install "prism-v0.87.23-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.23/prism-v0.87.23-linux-amd64"
      sha256 "20c008c814f9e9f1c791309aaa57047ea80a14e2bf0789abcd97512bf9969013"

      define_method(:install) do
        bin.install "prism-v0.87.23-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.23/prism-v0.87.23-linux-arm64"
      sha256 "5a768c90058ac70a95d501ef4c91387f795c819fe59382e9c459abdf3da73fbe"

      define_method(:install) do
        bin.install "prism-v0.87.23-linux-arm64" => "prism"
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
