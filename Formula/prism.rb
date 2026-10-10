# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.3/prism-v0.87.3-darwin-amd64"
      sha256 "92c6e32b3eb723148aba1e9058a9207999d88cef5d410b63e9f26c6d60524fad"

      define_method(:install) do
        bin.install "prism-v0.87.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.3/prism-v0.87.3-darwin-arm64"
      sha256 "32c2f7640a026e62fbb867b781a72eeaf01b8a1b41c1b8179c17398a841fae80"

      define_method(:install) do
        bin.install "prism-v0.87.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.3/prism-v0.87.3-linux-amd64"
      sha256 "fd78352c8db14e8878cb2182548f4974b7755a06954b0dc62c3331b962e18deb"

      define_method(:install) do
        bin.install "prism-v0.87.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.3/prism-v0.87.3-linux-arm64"
      sha256 "868deb8198c06dc46cbd8604e21d37e3adc5ed86e826c4e066150efe7d2d125e"

      define_method(:install) do
        bin.install "prism-v0.87.3-linux-arm64" => "prism"
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
