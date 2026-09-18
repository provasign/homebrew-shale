# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.77.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.77.2/prism-v0.77.2-darwin-amd64"
      sha256 "682b49b909d0703336920a2148757a00970415c1e8826784b70eaa2f1c1515d1"

      define_method(:install) do
        bin.install "prism-v0.77.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.77.2/prism-v0.77.2-darwin-arm64"
      sha256 "621ff13a62a9ab2801170cff40751137ea595fbc16cc07a9bbcad1a13c525788"

      define_method(:install) do
        bin.install "prism-v0.77.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.77.2/prism-v0.77.2-linux-amd64"
      sha256 "30ff17106556f912de16d3e206f9e907a70859a04c920d92b6a8762ce105de3f"

      define_method(:install) do
        bin.install "prism-v0.77.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.77.2/prism-v0.77.2-linux-arm64"
      sha256 "270b13e240c063e6432a70d8b64be915ec8acb394da99a66e313c95d5942254e"

      define_method(:install) do
        bin.install "prism-v0.77.2-linux-arm64" => "prism"
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
