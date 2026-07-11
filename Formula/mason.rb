# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.6.1/mason-v0.6.1-darwin-amd64"
      sha256 "f3ce6b1741e70ba09f5b76a77d024a920eacc619194d19f1a1f36e731488857d"

      define_method(:install) do
        bin.install "mason-v0.6.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.6.1/mason-v0.6.1-darwin-arm64"
      sha256 "a50303dd8ca1109b3b0129c1b645c7d37f0239f82c501cf5a05162f2597bad17"

      define_method(:install) do
        bin.install "mason-v0.6.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.6.1/mason-v0.6.1-linux-amd64"
      sha256 "8238834ea1ace639308739ea45f0bc869e4c5837e4f3d1f8c573305c4c9232ea"
      define_method(:install) do
        bin.install "mason-v0.6.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.6.1/mason-v0.6.1-linux-arm64"
      sha256 "d47338e356b8e94181c4d2da9d7f21586ffd07ed52162ec2f13518f6a4eea641"
      define_method(:install) do
        bin.install "mason-v0.6.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
