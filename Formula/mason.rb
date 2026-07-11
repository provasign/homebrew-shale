# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.12.0/mason-v0.12.0-darwin-amd64"
      sha256 "8a0f9af34d04fcb0985569fe18ccaf19160ad4f84a3a12a3de5e12443b9f17a4"

      define_method(:install) do
        bin.install "mason-v0.12.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.12.0/mason-v0.12.0-darwin-arm64"
      sha256 "7af395879ccf5ad60b4cb2c97c47c799d38ae02c843ae735ee9457c86741b5df"

      define_method(:install) do
        bin.install "mason-v0.12.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.12.0/mason-v0.12.0-linux-amd64"
      sha256 "e8838b69536f7c269c740ebe11186000e6e6dfc5bc93444ebc5362f2b5dedd85"
      define_method(:install) do
        bin.install "mason-v0.12.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.12.0/mason-v0.12.0-linux-arm64"
      sha256 "f4992e05b57efad144912a0de8653f27bfcdad169d1e6baecde9f2df08a8f171"
      define_method(:install) do
        bin.install "mason-v0.12.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
