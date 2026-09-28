# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.85.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.85.3/prism-v0.85.3-darwin-amd64"
      sha256 "5fef1efc6f9069ea17fb04ee83913c27069b1186e1197b8b62e1567c55946dc0"

      define_method(:install) do
        bin.install "prism-v0.85.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.85.3/prism-v0.85.3-darwin-arm64"
      sha256 "e075ae99043d21b8d77b5488690e69390fd72acaf37220a35857a9b50e754552"

      define_method(:install) do
        bin.install "prism-v0.85.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.3/prism-v0.85.3-linux-amd64"
      sha256 "9001d7df23ef35c4e72059008792b9d8433197082671beda7acf1abdbbd36f8f"

      define_method(:install) do
        bin.install "prism-v0.85.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.85.3/prism-v0.85.3-linux-arm64"
      sha256 "e216097faa9ebf81989ee7bffe034773e042469c612772cbe52682ebc0c95383"

      define_method(:install) do
        bin.install "prism-v0.85.3-linux-arm64" => "prism"
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
