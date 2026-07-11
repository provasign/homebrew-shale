# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.7.0/mason-v0.7.0-darwin-amd64"
      sha256 "2d39c517482ec95214c95ed1d62fb8abfd397ec1b6fd0ad33056ff396c18d654"

      define_method(:install) do
        bin.install "mason-v0.7.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.7.0/mason-v0.7.0-darwin-arm64"
      sha256 "9bc8b96165684f1c53d702f05c8587e73a79599c7664bd06adb8dcc09937cb9b"

      define_method(:install) do
        bin.install "mason-v0.7.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.0/mason-v0.7.0-linux-amd64"
      sha256 "06d3e045d9e4515db8283cbdb19824157c1da8c8096904b364fb68e7af1872ae"
      define_method(:install) do
        bin.install "mason-v0.7.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.7.0/mason-v0.7.0-linux-arm64"
      sha256 "b9da7b26f8ac530b04efe75629a139c333ec4589fe2e88d81393607037c6d736"
      define_method(:install) do
        bin.install "mason-v0.7.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
