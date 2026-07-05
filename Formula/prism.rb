# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.0/prism-v0.19.0-darwin-amd64"
      sha256 "bce42cf5809351041f7f1146b11d293f745708880e979676f673708f7da9a10a"

      define_method(:install) do
        bin.install "prism-v0.19.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.0/prism-v0.19.0-darwin-arm64"
      sha256 "498ad9c773aa9073eb219fe9d6c48b0fb238385ae7e5e890ba51ed39eb2293e9"

      define_method(:install) do
        bin.install "prism-v0.19.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.0/prism-v0.19.0-linux-amd64"
      sha256 "a3f66a79f7432b681b3ea05c8ec0ecc2a0168968ce34e97cb433fcce12c30866"
      define_method(:install) do
        bin.install "prism-v0.19.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.0/prism-v0.19.0-linux-arm64"
      sha256 "aa2233079bda70f55f50e529364ea3e1f18468a6ff8f3ccfda546e1181c48ca3"
      define_method(:install) do
        bin.install "prism-v0.19.0-linux-arm64" => "prism"
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
