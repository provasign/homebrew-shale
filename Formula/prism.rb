# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "0.87.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v0.87.4/prism-v0.87.4-darwin-amd64"
      sha256 "90e691db7294c74714167fe1552fc2a3663d4c7a44c6c4c07dfd702a5378ceee"

      define_method(:install) do
        bin.install "prism-v0.87.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v0.87.4/prism-v0.87.4-darwin-arm64"
      sha256 "fb652503de2164bca8157e762f85655acab65cc4a09934f4bad788196f1f4dce"

      define_method(:install) do
        bin.install "prism-v0.87.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.4/prism-v0.87.4-linux-amd64"
      sha256 "8e09fcfb476190059db63f4a40e76f1102a8be781127f925684726906e5344b1"

      define_method(:install) do
        bin.install "prism-v0.87.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v0.87.4/prism-v0.87.4-linux-arm64"
      sha256 "9f7d8840d7f4551c1f43a988bb8d231ccad442deb0773a2c9070baec56273f8c"

      define_method(:install) do
        bin.install "prism-v0.87.4-linux-arm64" => "prism"
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
