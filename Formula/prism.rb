# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.19.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.19.6/prism-v0.19.6-darwin-amd64"
      sha256 "a630c87b1b7d3e115722e87a606161df77b8a33a279b26828412883b5c0b481c"

      define_method(:install) do
        bin.install "prism-v0.19.6-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.19.6/prism-v0.19.6-darwin-arm64"
      sha256 "b7b928dc063575bdb47e39292b35c9f46f5ab18d10459f60f4ea504a05f24233"

      define_method(:install) do
        bin.install "prism-v0.19.6-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.6/prism-v0.19.6-linux-amd64"
      sha256 "9c1c53669c307d5a1ab6ac951e687d4eba7864b1bbf511a23e90c3c29c29f1a7"
      define_method(:install) do
        bin.install "prism-v0.19.6-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.19.6/prism-v0.19.6-linux-arm64"
      sha256 "ee2eea5c9a4759c17d1e813b93c9109beba92d9347346bf19eeda09fe8c1ee53"
      define_method(:install) do
        bin.install "prism-v0.19.6-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Register Prism with your AI tools from a project root:
        prism init . --mode both
    EOS
  end

  test do
    system "#{bin}/prism", "version"
  end
end
