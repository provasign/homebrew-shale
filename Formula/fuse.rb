# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.9.0/fuse-v0.9.0-darwin-amd64"
      sha256 "fc36f23b5004aacf30e460e07e5fbc77b39275b6e30d07524305ab0734f08691"

      define_method(:install) do
        bin.install "fuse-v0.9.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.9.0/fuse-v0.9.0-darwin-arm64"
      sha256 "e9efae4db2934ff445443453cf04f42aa9a27bf94452d7905fcd30e1dff67502"

      define_method(:install) do
        bin.install "fuse-v0.9.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.9.0/fuse-v0.9.0-linux-amd64"
      sha256 "9c3b2a8b302e54492d98924b4bb47923c5cb424d66baa1432d23a8b57004fad9"
      define_method(:install) do
        bin.install "fuse-v0.9.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.9.0/fuse-v0.9.0-linux-arm64"
      sha256 "34d691d05d71c1b4c590a01f4d79a17ac547be6a448e853462248f38f855ccf6"
      define_method(:install) do
        bin.install "fuse-v0.9.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
