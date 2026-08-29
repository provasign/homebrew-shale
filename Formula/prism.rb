# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.0/prism-v0.56.0-darwin-amd64"
      sha256 "ffd4a494816898e2a53b07ce0102c5555f2a711890b5be2bb21e4418431f2150"

      define_method(:install) do
        bin.install "prism-v0.56.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.0/prism-v0.56.0-darwin-arm64"
      sha256 "f6b45b1ad27012031d14882c9af50614f9125eb9f312db4ce7daca0b37b4ad44"

      define_method(:install) do
        bin.install "prism-v0.56.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.0/prism-v0.56.0-linux-amd64"
      sha256 "b520c5117bcc4410a6623a4dee2ee1913f34709a5489e415d63a23fc13e3a7d5"

      define_method(:install) do
        bin.install "prism-v0.56.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.0/prism-v0.56.0-linux-arm64"
      sha256 "d591bd28aa0adb0ba8645c887f4af4585bd66a23e81871162ae70eb340601d74"

      define_method(:install) do
        bin.install "prism-v0.56.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
