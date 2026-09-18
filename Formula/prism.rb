# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.77.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.77.3/prism-v0.77.3-darwin-amd64"
      sha256 "9362e08482509375d54897d7052ab1347a8a22f6162b29e7b9b7d8854b30121c"

      define_method(:install) do
        bin.install "prism-v0.77.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.77.3/prism-v0.77.3-darwin-arm64"
      sha256 "d2015751705d529542bb4068474e54c872eba044f534f1744f964d97549c70f5"

      define_method(:install) do
        bin.install "prism-v0.77.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.77.3/prism-v0.77.3-linux-amd64"
      sha256 "bb0a664df9949a70a3a08033d22306d5141b3df6a04bc3c45e8a58fcde1044fd"

      define_method(:install) do
        bin.install "prism-v0.77.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.77.3/prism-v0.77.3-linux-arm64"
      sha256 "bc7411d170ae78c8fc273eb88799a91afd38208016cb84ea86a4c1ab8a096545"

      define_method(:install) do
        bin.install "prism-v0.77.3-linux-arm64" => "prism"
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
