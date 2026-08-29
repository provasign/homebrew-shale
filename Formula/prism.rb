# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.6/prism-v0.56.6-darwin-amd64"
      sha256 "20e8d64975ff3e8aaa980ecd9b89806b98459d611850b362c8df6de4360c50d2"

      define_method(:install) do
        bin.install "prism-v0.56.6-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.6/prism-v0.56.6-darwin-arm64"
      sha256 "c2508f91fb6f8385ed3181002186bcd11240c80e91586d25990e1934167dd839"

      define_method(:install) do
        bin.install "prism-v0.56.6-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.6/prism-v0.56.6-linux-amd64"
      sha256 "da9fc1541f37f20765355f13e99b57fedb1eb0be5a0882c41f3f0f1eabe6757d"

      define_method(:install) do
        bin.install "prism-v0.56.6-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.6/prism-v0.56.6-linux-arm64"
      sha256 "a585c0c99c40b8f7ffeb8e29ff3db59783c5b2cdb5ea84c4b7a5302226bed36d"

      define_method(:install) do
        bin.install "prism-v0.56.6-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
