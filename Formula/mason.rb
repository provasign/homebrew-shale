# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.11.0/mason-v0.11.0-darwin-amd64"
      sha256 "85d14b6963f0440f36ca95f3cb1c9bb2860ddc4e316252c4f3c5147218f30ec2"

      define_method(:install) do
        bin.install "mason-v0.11.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.11.0/mason-v0.11.0-darwin-arm64"
      sha256 "732e756b0f52d29b2daa84f74109c0c55b127d5d5dc9f001de7d9102ee87cafb"

      define_method(:install) do
        bin.install "mason-v0.11.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.11.0/mason-v0.11.0-linux-amd64"
      sha256 "1e36aa819920d07261fbfb5540d4153d667fa2d672f9ccd9932d7cf4df8657de"
      define_method(:install) do
        bin.install "mason-v0.11.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.11.0/mason-v0.11.0-linux-arm64"
      sha256 "49df05ec735ad65905c89663044865319d3dd65e65ee767528ceca67921a7986"
      define_method(:install) do
        bin.install "mason-v0.11.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
