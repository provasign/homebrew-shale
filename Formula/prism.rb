# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.15.0/prism-v0.15.0-darwin-amd64"
      sha256 "ba13ea807fcb136f6921a9edb12091d3842cb1e5e1ad2ed9f4f2ed3301e766c2"

      define_method(:install) do
        bin.install "prism-v0.15.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.15.0/prism-v0.15.0-darwin-arm64"
      sha256 "69df6f21938f21ba36cc5a7039d6edf526687c733447200d2e2b347ccce92a0f"

      define_method(:install) do
        bin.install "prism-v0.15.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.15.0/prism-v0.15.0-linux-amd64"
      sha256 "fc9d274beadcce3ed3b91c7bba86d3c4573c225a053772e2bf26e16d6f0fee97"
      define_method(:install) do
        bin.install "prism-v0.15.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.15.0/prism-v0.15.0-linux-arm64"
      sha256 "16b3fcb858cd76799fc34a12edf42a988b2f1377fe487ffd3c9bb5b5a1e0c7d9"
      define_method(:install) do
        bin.install "prism-v0.15.0-linux-arm64" => "prism"
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
