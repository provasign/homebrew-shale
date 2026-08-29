# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.56.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.56.7/prism-v0.56.7-darwin-amd64"
      sha256 "94a6ea656079d455615bace37926b5cb7eaee787c84f90cad5167db1700c4b03"

      define_method(:install) do
        bin.install "prism-v0.56.7-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.56.7/prism-v0.56.7-darwin-arm64"
      sha256 "bd49dbc027cb19b0ceb48c5eb0fd1288b55435f126e6ad15ea2bbcc59e750d2c"

      define_method(:install) do
        bin.install "prism-v0.56.7-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.7/prism-v0.56.7-linux-amd64"
      sha256 "38c48af83b8584255034d432ee97b00e477ff326fe1a320c0c7ace2015636655"

      define_method(:install) do
        bin.install "prism-v0.56.7-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.56.7/prism-v0.56.7-linux-arm64"
      sha256 "8efff90f1d108c0b13645a7442b6f0778bbfd3fce2c984bf6f7d9da00c990849"

      define_method(:install) do
        bin.install "prism-v0.56.7-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
