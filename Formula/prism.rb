# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.6/prism-v0.72.6-darwin-amd64"
      sha256 "931491a1ea1426936416e9d5d8b36e23dbd415b4c1f8a697e11e07cea85615ad"

      define_method(:install) do
        bin.install "prism-v0.72.6-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.6/prism-v0.72.6-darwin-arm64"
      sha256 "76a592baaf1f2edf95d13713bed488b836b66007e54416d7e887891d463929a7"

      define_method(:install) do
        bin.install "prism-v0.72.6-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.6/prism-v0.72.6-linux-amd64"
      sha256 "0bef083a79c825915cccc1d384f4e2fbb46af4634330969cf5117b22e26f65aa"

      define_method(:install) do
        bin.install "prism-v0.72.6-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.6/prism-v0.72.6-linux-arm64"
      sha256 "ebf708aadbbda59db04387f1b7b0b706adad3d05b782fbc93555e271d5fa013b"

      define_method(:install) do
        bin.install "prism-v0.72.6-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Run `prism init --global` after installing or upgrading so AI clients
      use this Homebrew-managed executable. Run `prism init` inside existing
      projects to refresh project-level MCP registrations.

      Prism reports other installed copies when their versions differ.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
