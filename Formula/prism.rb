# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.7.0/prism-v0.7.0-darwin-amd64"
      sha256 "ea87542a73cabbd7f459bb51aeee52fa726aa684900537751e0476df86e39e68"

      define_method(:install) do
        bin.install "prism-v0.7.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.7.0/prism-v0.7.0-darwin-arm64"
      sha256 "d50f3618973216627426ee7511d420100ea2ed17645f13fd7b59e778d0e3a299"

      define_method(:install) do
        bin.install "prism-v0.7.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.7.0/prism-v0.7.0-linux-amd64"
      sha256 "1211125f341a6d01863b8affb8d0c6228c066b34275bbf47770f407a16ee6795"
      define_method(:install) do
        bin.install "prism-v0.7.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.7.0/prism-v0.7.0-linux-arm64"
      sha256 "889b284c9e7a949e06697734536752c57baaa244c01a57371fa5dcf0ae6502fb"
      define_method(:install) do
        bin.install "prism-v0.7.0-linux-arm64" => "prism"
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
