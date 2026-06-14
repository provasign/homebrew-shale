# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.14.0/prism-v0.14.0-darwin-amd64"
      sha256 "e4d1209917ac7b321b7b4287e68507b8ba929776285cf0f5b33d3ee8d478ef59"

      define_method(:install) do
        bin.install "prism-v0.14.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.14.0/prism-v0.14.0-darwin-arm64"
      sha256 "8437e4f68c43026c2cf39841fbb1b6959f5e879cdd49649ea95489c0825eb01a"

      define_method(:install) do
        bin.install "prism-v0.14.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.14.0/prism-v0.14.0-linux-amd64"
      sha256 "98e9ec347dfd9c1fd618ee87bad8364bc116dbbeda99fed8ff699eaf4cc3af14"
      define_method(:install) do
        bin.install "prism-v0.14.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.14.0/prism-v0.14.0-linux-arm64"
      sha256 "521fc80df0c3c6197364539b124e2b57a56ccf5ef2ad1e05d576720ebeeba8e4"
      define_method(:install) do
        bin.install "prism-v0.14.0-linux-arm64" => "prism"
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
