# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.2/prism-v0.56.2-darwin-amd64"
      sha256 "d4a3cbd3c80309bf69af7f73e87f6e0de7d880650b8fd0b6a2e96fefa2280fb7"

      define_method(:install) do
        bin.install "prism-v0.56.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.2/prism-v0.56.2-darwin-arm64"
      sha256 "55b43ca73e4e2f92333d86b67e2504740ebd132b5e1341d9807b038fbc201f4c"

      define_method(:install) do
        bin.install "prism-v0.56.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.2/prism-v0.56.2-linux-amd64"
      sha256 "aabfc09e63c8d0d7a954262f1001494c2a6dc3b1d238982abd8f91723011c0f4"

      define_method(:install) do
        bin.install "prism-v0.56.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.2/prism-v0.56.2-linux-arm64"
      sha256 "6dd50f3527f00b4d632aa0ce78900753db99f73df61c4ebefd5be15f441e673c"

      define_method(:install) do
        bin.install "prism-v0.56.2-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
