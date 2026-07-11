# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.10.0/mason-v0.10.0-darwin-amd64"
      sha256 "5d2942a616038147016a728d6c7911293bd03bd1ae4668b8beea36418669edcb"

      define_method(:install) do
        bin.install "mason-v0.10.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.10.0/mason-v0.10.0-darwin-arm64"
      sha256 "ebb066ef5710a1c09de3e6ad0f2bc868abf3e1711473dcb62c6520d47ad5c743"

      define_method(:install) do
        bin.install "mason-v0.10.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.10.0/mason-v0.10.0-linux-amd64"
      sha256 "46b7f21823f05adfa8c3c7c8cbfc075a6c78031aa5ca629cac2f8666e77827aa"
      define_method(:install) do
        bin.install "mason-v0.10.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.10.0/mason-v0.10.0-linux-arm64"
      sha256 "b4c4ba9fe47e1b8598f67efe401597aefe4eda089a4af6e492a472a44f2d92b4"
      define_method(:install) do
        bin.install "mason-v0.10.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
