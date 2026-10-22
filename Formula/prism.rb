# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.0.1/prism-v1.0.1-darwin-amd64"
      sha256 "d906cf090592547790759c6739e0ec227b7bd68a366dac23abf74d4930613136"

      define_method(:install) do
        bin.install "prism-v1.0.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.0.1/prism-v1.0.1-darwin-arm64"
      sha256 "3c54fc20e286d194ce8e2059bfa320d0fce44b187e8e11f52b272c887757804f"

      define_method(:install) do
        bin.install "prism-v1.0.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.0.1/prism-v1.0.1-linux-amd64"
      sha256 "2852824e18a52dfcf1bb961f4c6e836e3250c25105fb468df06731576ab712cb"

      define_method(:install) do
        bin.install "prism-v1.0.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.0.1/prism-v1.0.1-linux-arm64"
      sha256 "35460a6d4122bb2a991eabb0f268cc56ad229ab753fdc2296761da312fad1514"

      define_method(:install) do
        bin.install "prism-v1.0.1-linux-arm64" => "prism"
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
