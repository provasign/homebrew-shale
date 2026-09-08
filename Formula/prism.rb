# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.72.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.72.3/prism-v0.72.3-darwin-amd64"
      sha256 "f9c151f4db981b60f29c291c4f5c6d9a198f89388f8e718f0a5cbefe6c567c11"

      define_method(:install) do
        bin.install "prism-v0.72.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.72.3/prism-v0.72.3-darwin-arm64"
      sha256 "87dfd1172f6f0a62292d61fc50749d274f084c3413cf8dfa47cc10c49a919cd9"

      define_method(:install) do
        bin.install "prism-v0.72.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.3/prism-v0.72.3-linux-amd64"
      sha256 "013b22709fa1119fcbb9b440c43501649b9aaa341398b410cc4505a711733549"

      define_method(:install) do
        bin.install "prism-v0.72.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.72.3/prism-v0.72.3-linux-arm64"
      sha256 "05614d7fea413a96e79d2622334ba53442231fae7d823a44999739ed7b282dce"

      define_method(:install) do
        bin.install "prism-v0.72.3-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
