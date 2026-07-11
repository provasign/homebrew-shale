# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.2.0/mason-v0.2.0-darwin-amd64"
      sha256 "ed1c765a4a895d922adb1829cfce685dd09a67213ed950ab38f99c2621b67ead"

      define_method(:install) do
        bin.install "mason-v0.2.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.2.0/mason-v0.2.0-darwin-arm64"
      sha256 "1f4c9b2d196ccf2347ec2ce547ff24d357975570a50a31d67b82ea363bcf6043"

      define_method(:install) do
        bin.install "mason-v0.2.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.2.0/mason-v0.2.0-linux-amd64"
      sha256 "ab7ddce61cd86214161667bd49e111e4c5d6b14397325dfb2e8c226c6c96d125"
      define_method(:install) do
        bin.install "mason-v0.2.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.2.0/mason-v0.2.0-linux-arm64"
      sha256 "c07621dce020a92d10084bb6f204e9e5c3354170c52c2b042513cb2af3b2ed89"
      define_method(:install) do
        bin.install "mason-v0.2.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
