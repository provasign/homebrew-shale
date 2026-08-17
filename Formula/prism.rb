# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.3/prism-v0.55.3-darwin-amd64"
      sha256 "98adfd4d8e479fe23eefc4bc813bd7dd765a36cd59ccf61389962556bd42ccc5"

      define_method(:install) do
        bin.install "prism-v0.55.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.3/prism-v0.55.3-darwin-arm64"
      sha256 "7b8a1bdd51432c7b427e0d8c368bfd4766ccdc35192a029f4378b6eeafed73a2"

      define_method(:install) do
        bin.install "prism-v0.55.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.3/prism-v0.55.3-linux-amd64"
      sha256 "632c69f38587cb6c748f6a6e06514bc3f0b70ccf3dc02c1cc459ea4cc8a1a758"

      define_method(:install) do
        bin.install "prism-v0.55.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.3/prism-v0.55.3-linux-arm64"
      sha256 "471240ea6ffdf8a59cf92204cb3bed3e6faf809ebe58804871cfb4f06b0ed54e"

      define_method(:install) do
        bin.install "prism-v0.55.3-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
