# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.11.0/prism-v0.11.0-darwin-amd64"
      sha256 "82ffbba619a9dc1bc136e8a9399b2c206a3829fe49971b600cfbef387b96bd4f"

      define_method(:install) do
        bin.install "prism-v0.11.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.11.0/prism-v0.11.0-darwin-arm64"
      sha256 "97f53eb122c1433f494acaa3bc17216e41d570bb27e8a22ba7e3cd641ea49ca2"

      define_method(:install) do
        bin.install "prism-v0.11.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.11.0/prism-v0.11.0-linux-amd64"
      sha256 "9495b24c06d70856f3997633eaed63ab6fc9c46058205040baa34f224a94ade8"
      define_method(:install) do
        bin.install "prism-v0.11.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.11.0/prism-v0.11.0-linux-arm64"
      sha256 "a04653754b63c44fce112d00da94a9ed8add669a56a70a346861bf8fdb81b51a"
      define_method(:install) do
        bin.install "prism-v0.11.0-linux-arm64" => "prism"
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
