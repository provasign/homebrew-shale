# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.9.0/mason-v0.9.0-darwin-amd64"
      sha256 "108185fdd6a42aa44477176616dac969d5631a29814a453ba8196bc539b6c4bd"

      define_method(:install) do
        bin.install "mason-v0.9.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.9.0/mason-v0.9.0-darwin-arm64"
      sha256 "15fef3439be2b0bdc909139fb7d597b1145ee363604b2dbbb733d94919ba7fe4"

      define_method(:install) do
        bin.install "mason-v0.9.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.9.0/mason-v0.9.0-linux-amd64"
      sha256 "80443c836dd6f9653e1412ac350101386ab91072b5f314b7d54fdf0c18d79eff"
      define_method(:install) do
        bin.install "mason-v0.9.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.9.0/mason-v0.9.0-linux-arm64"
      sha256 "37a9b903dba7fbf107537912b6207f1c8d5d773a7a7b723e87e054c496ebf286"
      define_method(:install) do
        bin.install "mason-v0.9.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
