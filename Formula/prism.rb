# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.82.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.82.1/prism-v0.82.1-darwin-amd64"
      sha256 "f163c8c903c1692b9257e18ba92f4f1b65d75ceabfc5a953ab8eb0bc55eec589"

      define_method(:install) do
        bin.install "prism-v0.82.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.82.1/prism-v0.82.1-darwin-arm64"
      sha256 "cc5b7629538fb240b14bef37c8a519fee21e459e0aa3408b518e2f1670cbfc4d"

      define_method(:install) do
        bin.install "prism-v0.82.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.82.1/prism-v0.82.1-linux-amd64"
      sha256 "d72334098494e188501e3bc398397e29e6e2267115a538b25095daa1c8ddbd36"

      define_method(:install) do
        bin.install "prism-v0.82.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.82.1/prism-v0.82.1-linux-arm64"
      sha256 "96b9ce850ff7c1371526351ba1162da7555f49d2420dae93dc3d8bb94c709245"

      define_method(:install) do
        bin.install "prism-v0.82.1-linux-arm64" => "prism"
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
