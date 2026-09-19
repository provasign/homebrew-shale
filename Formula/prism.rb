# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.79.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.79.0/prism-v0.79.0-darwin-amd64"
      sha256 "e6e3683d65a4c20c99c043dc0e7035b7381d8045bb299a58d217909cba2ac686"

      define_method(:install) do
        bin.install "prism-v0.79.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.79.0/prism-v0.79.0-darwin-arm64"
      sha256 "c00afa74a4109fe5a3bc8fdc7667040f15335dc3635d5f9b54890b4d95aa584e"

      define_method(:install) do
        bin.install "prism-v0.79.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.79.0/prism-v0.79.0-linux-amd64"
      sha256 "f641917611a3a03818fd77322db8e6676f341d8839463a1eeed449d94eb219a3"

      define_method(:install) do
        bin.install "prism-v0.79.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.79.0/prism-v0.79.0-linux-arm64"
      sha256 "f021b70134ff438a121989d5fd990b042d283efd7bad1e04f35f89cbb899c99f"

      define_method(:install) do
        bin.install "prism-v0.79.0-linux-arm64" => "prism"
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
