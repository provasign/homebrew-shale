# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.3.1/mason-v0.3.1-darwin-amd64"
      sha256 "1b03d1c546c3dfbc840d1baa39e4dc625f5f34218aa151eee0ec49efcaa5a306"

      define_method(:install) do
        bin.install "mason-v0.3.1-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.3.1/mason-v0.3.1-darwin-arm64"
      sha256 "baf21353619ee87803a2e033f8d809bf1b5166c9842c340bd6719d551926c6bc"

      define_method(:install) do
        bin.install "mason-v0.3.1-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.3.1/mason-v0.3.1-linux-amd64"
      sha256 "b950556f08c282d92cfc74a63d87b5fbfa0231b21bc6fad59ef2e0af267006c9"
      define_method(:install) do
        bin.install "mason-v0.3.1-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.3.1/mason-v0.3.1-linux-arm64"
      sha256 "8af0f95a4d1dc3f3d015da58fd48f7b8a59fa9531b4af03a5c144c8053a0f31e"
      define_method(:install) do
        bin.install "mason-v0.3.1-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
