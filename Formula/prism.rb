# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.14.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.14.2/prism-v0.14.2-darwin-amd64"
      sha256 "24be734d23e00a423f79b3c5b4bb61e80933f2e5820d742c706ae333329f7d36"

      define_method(:install) do
        bin.install "prism-v0.14.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.14.2/prism-v0.14.2-darwin-arm64"
      sha256 "a5073b2ddd5ed1bb69605d49ffb5a48a27a60fa9f74f297df0a188b9e48366b2"

      define_method(:install) do
        bin.install "prism-v0.14.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.14.2/prism-v0.14.2-linux-amd64"
      sha256 "5cbbf140689e5a8127347c3e22db6f2a67a904419f184a6d60935565443eed9a"
      define_method(:install) do
        bin.install "prism-v0.14.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.14.2/prism-v0.14.2-linux-arm64"
      sha256 "b5fbe8457d52b37e567ccb9a284ad296e12d4cc39a911c55ef3bca529de17a64"
      define_method(:install) do
        bin.install "prism-v0.14.2-linux-arm64" => "prism"
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
