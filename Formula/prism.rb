# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.8/prism-v0.56.8-darwin-amd64"
      sha256 "2f7be3bd3a77689fdbe32d7ca0684854892c86c1ba0bb2fac61d81a49cc4f7a3"

      define_method(:install) do
        bin.install "prism-v0.56.8-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.8/prism-v0.56.8-darwin-arm64"
      sha256 "537ec2d1b0bd0e1217ae230ca68e20617b601951640f30c76a46d2e1c4be9b8c"

      define_method(:install) do
        bin.install "prism-v0.56.8-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.8/prism-v0.56.8-linux-amd64"
      sha256 "6f5e0f3c4489339ac68053d86b304aac1abea0583a27a48606f21ffb19055f7a"

      define_method(:install) do
        bin.install "prism-v0.56.8-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.8/prism-v0.56.8-linux-arm64"
      sha256 "308fe3d25cc75eace1f3b755fb6463ee98580901170ab717609f85351a57b429"

      define_method(:install) do
        bin.install "prism-v0.56.8-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
