# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.5/prism-v0.19.5-darwin-amd64"
      sha256 "6e1e70eaa8a21553a269aee1475bbeb4cbd0e5f9f437694dc2625a64481aa729"

      define_method(:install) do
        bin.install "prism-v0.19.5-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.5/prism-v0.19.5-darwin-arm64"
      sha256 "9972879fd73d11496fd5c96e8f23c3ca0522abe4fcfa47b7f21507ab407854d9"

      define_method(:install) do
        bin.install "prism-v0.19.5-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.5/prism-v0.19.5-linux-amd64"
      sha256 "1d1ccb1300caba1198c2ce5bc11d406a7549f0b9c5b8d4016cebecfcbd331e9d"
      define_method(:install) do
        bin.install "prism-v0.19.5-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.5/prism-v0.19.5-linux-arm64"
      sha256 "0cb7aa3465578435a4f64aaa76123ee2aec2f62d842639b87d0db6364983ce27"
      define_method(:install) do
        bin.install "prism-v0.19.5-linux-arm64" => "prism"
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
