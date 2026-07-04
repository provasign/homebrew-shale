# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.16.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.16.1/prism-v0.16.1-darwin-amd64"
      sha256 "9e075c951a38414fb2bb3d37da5763c21299fbce16d394f62329ea33927a8ba2"

      define_method(:install) do
        bin.install "prism-v0.16.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.16.1/prism-v0.16.1-darwin-arm64"
      sha256 "b765bd072bf363717f25cb471e0e34843ac0aa7278a8335af9e925c2e3b82acf"

      define_method(:install) do
        bin.install "prism-v0.16.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.16.1/prism-v0.16.1-linux-amd64"
      sha256 "1d1b9b2210ba1077f5ba4893014e9add13892502ddacd3acd1a441541786fcda"
      define_method(:install) do
        bin.install "prism-v0.16.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.16.1/prism-v0.16.1-linux-arm64"
      sha256 "cffe24be0c08d54250d35ef7def95e2b831198e149bcb25da3bc14d8c3b4c920"
      define_method(:install) do
        bin.install "prism-v0.16.1-linux-arm64" => "prism"
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
