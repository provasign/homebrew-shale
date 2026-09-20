# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.80.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.80.2/prism-v0.80.2-darwin-amd64"
      sha256 "de7ff46b69bbf8ca55229535e25347b90f82dcced0fa9a75b296bb009e88e6dc"

      define_method(:install) do
        bin.install "prism-v0.80.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.80.2/prism-v0.80.2-darwin-arm64"
      sha256 "676c4c4684112ee20024c7abee5befcb1e9a4cd1bead70c8bf4b862118886382"

      define_method(:install) do
        bin.install "prism-v0.80.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.80.2/prism-v0.80.2-linux-amd64"
      sha256 "63d106a7f6216e5044277ec9c172df71e395d08e7880731c2c8c9cd871101150"

      define_method(:install) do
        bin.install "prism-v0.80.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.80.2/prism-v0.80.2-linux-arm64"
      sha256 "a269367ce483e6535b864a25c7acbd9e63e594d092064f23297ef23308d800e2"

      define_method(:install) do
        bin.install "prism-v0.80.2-linux-arm64" => "prism"
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
