# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.61.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.61.2/prism-v0.61.2-darwin-amd64"
      sha256 "a25b036368fbac289a4546fac9225597b66e2f1a3cf788e19b347c85d8d0c095"

      define_method(:install) do
        bin.install "prism-v0.61.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.61.2/prism-v0.61.2-darwin-arm64"
      sha256 "d572ccb37bd038a7aee58edb7ed752a7e301fc1523450ebf5cde64c2e526e0c3"

      define_method(:install) do
        bin.install "prism-v0.61.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.61.2/prism-v0.61.2-linux-amd64"
      sha256 "86f4a80513b00777a9e72a9d512d7ffb0344e078e072ecc16bc6a10d09c7da1f"

      define_method(:install) do
        bin.install "prism-v0.61.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.61.2/prism-v0.61.2-linux-arm64"
      sha256 "111beeb94ae1eec3a963cb8b29df3e121b16f3683958ce96f9f7a3a5fc110a36"

      define_method(:install) do
        bin.install "prism-v0.61.2-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
