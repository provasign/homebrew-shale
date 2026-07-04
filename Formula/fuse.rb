# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.13.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.13.2/fuse-v0.13.2-darwin-amd64"
      sha256 "6d8fc0204246785895781e628234f8f9bccdfbbc6ada1e95f9de454424e52b15"

      define_method(:install) do
        bin.install "fuse-v0.13.2-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.13.2/fuse-v0.13.2-darwin-arm64"
      sha256 "677ca8cf6f02faf127c3321ccfa8926ab0cc72a1e6601fe0f37ee2e853ba29b1"

      define_method(:install) do
        bin.install "fuse-v0.13.2-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.2/fuse-v0.13.2-linux-amd64"
      sha256 "1d9662cdaba775bbe3f6daaecd0e3d9a202410520902a16f816034cb3237f426"
      define_method(:install) do
        bin.install "fuse-v0.13.2-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.13.2/fuse-v0.13.2-linux-arm64"
      sha256 "4e6cadcd4cd3c1e99cabb32a4eb27433e8a4390e6d4c473ade91865c2383a7fc"
      define_method(:install) do
        bin.install "fuse-v0.13.2-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
