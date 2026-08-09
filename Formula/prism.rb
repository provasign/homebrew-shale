# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.39.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.39.0/prism-v0.39.0-darwin-amd64"
      sha256 "1ed0edb2c4c3c58de969a3f4d5cdae27ace07303a31f7a35f48341d6a8a80e72"

      define_method(:install) do
        bin.install "prism-v0.39.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.39.0/prism-v0.39.0-darwin-arm64"
      sha256 "fddd66f4a1d8774cffac7defb531c12de187d35c58826c2ac8b97700a73d67f1"

      define_method(:install) do
        bin.install "prism-v0.39.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.39.0/prism-v0.39.0-linux-amd64"
      sha256 "dfede1849f502d20789dfac811aaa083b93f04d23f854bf1a20e52ef62309cd4"

      define_method(:install) do
        bin.install "prism-v0.39.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.39.0/prism-v0.39.0-linux-arm64"
      sha256 "454ba75d31b5f06b3662a8085506add6f6c44f9fc569ae5778a9f4f326500163"

      define_method(:install) do
        bin.install "prism-v0.39.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
