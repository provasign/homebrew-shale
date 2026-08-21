# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.10/prism-v0.55.10-darwin-amd64"
      sha256 "ba8e0f3f710bedbf73f84c18b15bb76bdc759e32204982fbc852902be5cdb377"

      define_method(:install) do
        bin.install "prism-v0.55.10-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.10/prism-v0.55.10-darwin-arm64"
      sha256 "65efabb17c79e2835a3fff093ca3cfba2103ba5ff690f5c7746e382a04dda737"

      define_method(:install) do
        bin.install "prism-v0.55.10-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.10/prism-v0.55.10-linux-amd64"
      sha256 "7fe1a3555786db5b47fe49d83772d5d3b10c3d38a5bc438af394d5fd7149b14d"

      define_method(:install) do
        bin.install "prism-v0.55.10-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.10/prism-v0.55.10-linux-arm64"
      sha256 "eb9e426d1d6e486f4547cc2a32c6daff3cad4128ca335a6bed5a8c44f1c5af75"

      define_method(:install) do
        bin.install "prism-v0.55.10-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
