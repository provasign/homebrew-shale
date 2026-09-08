# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.5/prism-v0.72.5-darwin-amd64"
      sha256 "7e584508c00fc22c658007f06cce50b992a3a4613e8e94422b2380ae7f9fd3e4"

      define_method(:install) do
        bin.install "prism-v0.72.5-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.5/prism-v0.72.5-darwin-arm64"
      sha256 "f03bf96d966453221afd79742b6e535eca5d42f1bd646594976eb4cd6c9e2c3c"

      define_method(:install) do
        bin.install "prism-v0.72.5-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.5/prism-v0.72.5-linux-amd64"
      sha256 "1ea455b439dac21dcd6632d55b263d77da1653a1f2bb3334447f71cad44d1d69"

      define_method(:install) do
        bin.install "prism-v0.72.5-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.5/prism-v0.72.5-linux-arm64"
      sha256 "5142917453cb9aaa98f21644d9741a4a4541b46f8ac0e84f2ac0d30e532d00d3"

      define_method(:install) do
        bin.install "prism-v0.72.5-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
