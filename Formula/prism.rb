# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.58.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.58.0/prism-v0.58.0-darwin-amd64"
      sha256 "5f787e647ee3d009e8b098d53dbec94bd4d01d423d9b0fac590b1ad176404cb8"

      define_method(:install) do
        bin.install "prism-v0.58.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.58.0/prism-v0.58.0-darwin-arm64"
      sha256 "d458035ff7b058408b56bc649a9d61fe713a35f3a77846b973b3e212a4ba2364"

      define_method(:install) do
        bin.install "prism-v0.58.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.58.0/prism-v0.58.0-linux-amd64"
      sha256 "e5bfb59100a30acc943ebb30b90563b074db94b279cc8fd42d4afa717652b2a6"

      define_method(:install) do
        bin.install "prism-v0.58.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.58.0/prism-v0.58.0-linux-arm64"
      sha256 "a1025558a9220c2b442dd2bd1ed1a65513a6115462d277253f5e9a1ef265be1c"

      define_method(:install) do
        bin.install "prism-v0.58.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
