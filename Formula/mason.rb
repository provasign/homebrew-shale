# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.31.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.31.2/mason-v0.31.2-darwin-amd64"
      sha256 "d08bafef3f2756c9c391781993b9af4ac55436c64ffdfba57645ff8a42fea396"

      define_method(:install) do
        bin.install "mason-v0.31.2-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.31.2/mason-v0.31.2-darwin-arm64"
      sha256 "de44a79d93dfd0259cc734433ac9c05221d34f5a79dd3fb80366927a07267210"

      define_method(:install) do
        bin.install "mason-v0.31.2-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.31.2/mason-v0.31.2-linux-amd64"
      sha256 "5793b2b9c3cfa2dc2bb8a0b3946a5ee20aeac86729b771342a16e77efadd02e7"

      define_method(:install) do
        bin.install "mason-v0.31.2-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.31.2/mason-v0.31.2-linux-arm64"
      sha256 "f4489391cd25850da41cab2538b75227ced6dcc56182b543f2b552d45ec6c31f"

      define_method(:install) do
        bin.install "mason-v0.31.2-linux-arm64" => "mason"
      end
    end
  end

  test do
    assert_match "mason", shell_output("#{bin}/mason version")
  end
end
