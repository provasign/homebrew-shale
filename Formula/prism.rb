# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.14.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.14.1/prism-v0.14.1-darwin-amd64"
      sha256 "195b8846a7a8454329b673258b5c119690fcfe127f6c8326db0117a0a15b9641"

      define_method(:install) do
        bin.install "prism-v0.14.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.14.1/prism-v0.14.1-darwin-arm64"
      sha256 "959aa5a44604ae9ee7c1d80365a9a43907141cf70dfc3f2dd6f2c180d016a5e7"

      define_method(:install) do
        bin.install "prism-v0.14.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.14.1/prism-v0.14.1-linux-amd64"
      sha256 "ba60873372fe2b1698f23a86a44b74c632cae1e19ffa466900cb056e799ed817"
      define_method(:install) do
        bin.install "prism-v0.14.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.14.1/prism-v0.14.1-linux-arm64"
      sha256 "81622231e4503550898a316589e9db7f373296f3788962febba78d4bb6411b6e"
      define_method(:install) do
        bin.install "prism-v0.14.1-linux-arm64" => "prism"
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
