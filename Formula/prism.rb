# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.86.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.86.7/prism-v0.86.7-darwin-amd64"
      sha256 "8c698004c9590a164d72d2c3b5074735202adb90e09582f2ce58836457952b3e"

      define_method(:install) do
        bin.install "prism-v0.86.7-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.86.7/prism-v0.86.7-darwin-arm64"
      sha256 "1fc9e6a71daef3b89a92c597b538203411b09af2dfe38e225e73a19d11e70da8"

      define_method(:install) do
        bin.install "prism-v0.86.7-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.7/prism-v0.86.7-linux-amd64"
      sha256 "7fdd3fb6c0b3bbb28ce14726fc2781f85c65f4a8c54fe61afb324eaed058533d"

      define_method(:install) do
        bin.install "prism-v0.86.7-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.86.7/prism-v0.86.7-linux-arm64"
      sha256 "f86b128d47ab99ab7c8f3ac7f8d5f48dc438876644effa5e610adf9bd4b7c63b"

      define_method(:install) do
        bin.install "prism-v0.86.7-linux-arm64" => "prism"
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
