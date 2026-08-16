# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.55.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.55.1/prism-v0.55.1-darwin-amd64"
      sha256 "cd9409ff1ae8c5e74fa74ebe51203d83dbfdfde7cf5b8e9b3f385842a87ddad0"

      define_method(:install) do
        bin.install "prism-v0.55.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.55.1/prism-v0.55.1-darwin-arm64"
      sha256 "b312adcfae5f717725897e66d56a78edf893a237accae145b8592f6931cfefbe"

      define_method(:install) do
        bin.install "prism-v0.55.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.1/prism-v0.55.1-linux-amd64"
      sha256 "49033cec96040a1192d33cd2e065fffeee126d3906054cce738d671710893c37"

      define_method(:install) do
        bin.install "prism-v0.55.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.55.1/prism-v0.55.1-linux-arm64"
      sha256 "7e3ab43896c1b0c07a9f7e8b0398eaefb01b70543996fc25664a23fca90720f5"

      define_method(:install) do
        bin.install "prism-v0.55.1-linux-arm64" => "prism"
      end
    end
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
