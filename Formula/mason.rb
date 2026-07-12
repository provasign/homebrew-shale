# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.14.0/mason-v0.14.0-darwin-amd64"
      sha256 "e54d68e42e5cd5b9ea3dc05fade6fd2d708dcc891af6a34ad52ee04eb8b583fc"

      define_method(:install) do
        bin.install "mason-v0.14.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.14.0/mason-v0.14.0-darwin-arm64"
      sha256 "4288effceb59f0027a6c53819a11679b08963aca3486fbb023e8f2a0a3439ae2"

      define_method(:install) do
        bin.install "mason-v0.14.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.14.0/mason-v0.14.0-linux-amd64"
      sha256 "c8f18d541f3e5cc3e8e2a00fe48623bb0ca373e0f999970a42bb30018acb5d6f"
      define_method(:install) do
        bin.install "mason-v0.14.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.14.0/mason-v0.14.0-linux-arm64"
      sha256 "c514c0760ecdcc03a769a80bfa63f62da9b8121fa85841657c4cf5e6ce63fabf"
      define_method(:install) do
        bin.install "mason-v0.14.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
