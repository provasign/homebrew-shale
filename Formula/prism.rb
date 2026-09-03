# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.66.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.66.0/prism-v0.66.0-darwin-amd64"
      sha256 "812fb51eb94bb01cd5fff1ab41a21670866e23f1bc083e6a85cde0a89374d241"

      define_method(:install) do
        bin.install "prism-v0.66.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.66.0/prism-v0.66.0-darwin-arm64"
      sha256 "6efe73aa402c60922376c5d994a860832fb28bc1886de430a64b19e519c2b1cc"

      define_method(:install) do
        bin.install "prism-v0.66.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.66.0/prism-v0.66.0-linux-amd64"
      sha256 "027446a9fdb9ca16f527995e661346b7de29953fccd9f15c5ba4e949529af443"

      define_method(:install) do
        bin.install "prism-v0.66.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.66.0/prism-v0.66.0-linux-arm64"
      sha256 "5bbb603784f03fd66df08a2821b58523ba9697603aed2ad42fb5042b8643390d"

      define_method(:install) do
        bin.install "prism-v0.66.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
