# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.21.0/prism-v0.21.0-darwin-amd64"
      sha256 "f18ce0e48a275edf825dd8e8262e3d1a28a9333032fa25b7aab6a0f4f137bfee"

      define_method(:install) do
        bin.install "prism-v0.21.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.21.0/prism-v0.21.0-darwin-arm64"
      sha256 "d1c36be836154ff027488891ad78c130e06188bf9ca42abc33e4eb6e96adf09d"

      define_method(:install) do
        bin.install "prism-v0.21.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.21.0/prism-v0.21.0-linux-amd64"
      sha256 "1fb0d349b95d2e61301707a349b2a5a74aa5f5c66b2c620e4c09625dba7e1b24"
      define_method(:install) do
        bin.install "prism-v0.21.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.21.0/prism-v0.21.0-linux-arm64"
      sha256 "de9ea42f1b726ccda7432a8accedf783300872e5c4de11a05160049bef69786c"
      define_method(:install) do
        bin.install "prism-v0.21.0-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Register Prism with your AI tools from a project root:
        prism init . --mode both
    EOS
  end

  test do
    system "#{bin}/prism", "version"
  end
end
