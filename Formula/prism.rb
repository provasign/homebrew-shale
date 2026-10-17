# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.30"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.30/prism-v0.87.30-darwin-amd64"
      sha256 "983af4a1f60b363fba133d102ebf5bfcbd34f7ec2871f29ef2ce63b3a5239a5b"

      define_method(:install) do
        bin.install "prism-v0.87.30-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.30/prism-v0.87.30-darwin-arm64"
      sha256 "79a76cbf40e94f37a0da1505e12ec15f9add79b640b31a698ec70a55a7b2471c"

      define_method(:install) do
        bin.install "prism-v0.87.30-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.30/prism-v0.87.30-linux-amd64"
      sha256 "07040fa110904524169ca3a1ae8f557e8e89e643cdaffdae26dee42dd6878d06"

      define_method(:install) do
        bin.install "prism-v0.87.30-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.30/prism-v0.87.30-linux-arm64"
      sha256 "4aa12cc3fc776e9a821e05fd9ca96057e58558e23aa0e52d99d1d446711d41bf"

      define_method(:install) do
        bin.install "prism-v0.87.30-linux-arm64" => "prism"
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
