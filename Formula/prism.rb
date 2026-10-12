# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.14/prism-v0.87.14-darwin-amd64"
      sha256 "2a41d8ffbcf6bebe9b030289a38d8ad61c788fa2107f42abc993016b9e9926f2"

      define_method(:install) do
        bin.install "prism-v0.87.14-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.14/prism-v0.87.14-darwin-arm64"
      sha256 "44a8a167c3e5cae175b71c89061b2a2c5c10c2c4cedbc50b530a101a5b229814"

      define_method(:install) do
        bin.install "prism-v0.87.14-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.14/prism-v0.87.14-linux-amd64"
      sha256 "0bba9090c5c97c34dfe8a97e48f5ed2461d9222f29c62875702dcf9f379198aa"

      define_method(:install) do
        bin.install "prism-v0.87.14-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.14/prism-v0.87.14-linux-arm64"
      sha256 "5337628ad4d5a9b5817417d633ada3bab78365d53c1eb60cf596877fa9dacbe0"

      define_method(:install) do
        bin.install "prism-v0.87.14-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Run `prism init` inside each project after installing or upgrading to
      configure supported AI clients. Prism setup is project-scoped;
      `prism init --global` is no longer supported.

      Restart or reload running AI clients after upgrading Prism.

      Prism reports other installed copies when their versions differ.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
