# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.11/prism-v0.87.11-darwin-amd64"
      sha256 "08aaf2627596c4802ccc31afe0e8f9424fac3028e825be0e248fb96d8fca19cf"

      define_method(:install) do
        bin.install "prism-v0.87.11-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.11/prism-v0.87.11-darwin-arm64"
      sha256 "9b05c9665ca4ea4f2be5d116eb1e24acc12fd95514b472de13da316aac7ddc0f"

      define_method(:install) do
        bin.install "prism-v0.87.11-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.11/prism-v0.87.11-linux-amd64"
      sha256 "478490503e68264244838f89d781597a4e30429e70e6a18d1402fab45ef41a52"

      define_method(:install) do
        bin.install "prism-v0.87.11-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.11/prism-v0.87.11-linux-arm64"
      sha256 "6cfc496edfab9e557ef8dec682710f9354c0c1a967319394134b9ac9001cf530"

      define_method(:install) do
        bin.install "prism-v0.87.11-linux-arm64" => "prism"
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
