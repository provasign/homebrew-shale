# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.43.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.43.0/prism-v0.43.0-darwin-amd64"
      sha256 "591c38172518b1ca9fb200d79dcde34da5448e37ae93f30095c6b381e6da421b"

      define_method(:install) do
        bin.install "prism-v0.43.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.43.0/prism-v0.43.0-darwin-arm64"
      sha256 "2caca780353b1e376c84c1444be404873add2059deb4215fb43898db3eec72e4"

      define_method(:install) do
        bin.install "prism-v0.43.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.43.0/prism-v0.43.0-linux-amd64"
      sha256 "479af724bdb1148ff37055cef14939b7dfdf12c902f2f4a3fe4f4b7d0f235a36"

      define_method(:install) do
        bin.install "prism-v0.43.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.43.0/prism-v0.43.0-linux-arm64"
      sha256 "e44ac08ab04ec7eaaf6b2b9b771b753e9cde9a6f4a09f887aa98383381eaf7b6"

      define_method(:install) do
        bin.install "prism-v0.43.0-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
