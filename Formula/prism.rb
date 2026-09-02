# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.65.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.65.3/prism-v0.65.3-darwin-amd64"
      sha256 "3af89095edfd45c8e9b2f617ee045805c98a14d29086669e4bc51c18b6a38cf0"

      define_method(:install) do
        bin.install "prism-v0.65.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.65.3/prism-v0.65.3-darwin-arm64"
      sha256 "9045cce94a423a1989a46664dc28550440f8733ebd387c4cd3495c8930ae68aa"

      define_method(:install) do
        bin.install "prism-v0.65.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.65.3/prism-v0.65.3-linux-amd64"
      sha256 "42a95b7ac675c7568a3a6cc48f4aad350e163d262dda1696fe368bf6d866c8e3"

      define_method(:install) do
        bin.install "prism-v0.65.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.65.3/prism-v0.65.3-linux-arm64"
      sha256 "fd8549713619b06bcb54cf8c699473f5f4e85cbf400e33e881c510e0e382811c"

      define_method(:install) do
        bin.install "prism-v0.65.3-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
