# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.2/prism-v0.72.2-darwin-amd64"
      sha256 "03c355158737c2df456116cb8aaab5107eb128d097a51aff26a7ee3ceb417e6d"

      define_method(:install) do
        bin.install "prism-v0.72.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.2/prism-v0.72.2-darwin-arm64"
      sha256 "2e4733cf76e44caf073688dc224e62900c9d47fd05d926072a341e773c95194f"

      define_method(:install) do
        bin.install "prism-v0.72.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.2/prism-v0.72.2-linux-amd64"
      sha256 "68143b153dcfc240fbfe3e373b2d09a0cf68d05f33e69cf844ae5b15f410a316"

      define_method(:install) do
        bin.install "prism-v0.72.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.2/prism-v0.72.2-linux-arm64"
      sha256 "2e0d7d9d275c4c9d26c98db82a5912b687c91e849f04f60ec9260a56451d7b2c"

      define_method(:install) do
        bin.install "prism-v0.72.2-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
