# typed: false
# frozen_string_literal: true

class Fuse < Formula
  desc "Semantic git merge driver — symbol-aware auto-resolution with AI handoff"
  homepage "https://github.com/provasign/fuse"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/fuse/releases/download/v0.8.0/fuse-v0.8.0-darwin-amd64"
      sha256 "326ef21fcd04cc5d5628bb0d13c64b39b38de7c0360d9b5f1a57540f52c0f186"

      define_method(:install) do
        bin.install "fuse-v0.8.0-darwin-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/fuse/releases/download/v0.8.0/fuse-v0.8.0-darwin-arm64"
      sha256 "bb07e03f8b3e632e3d8c7da3f4f4edacd597f72cb55f8b34d7524ae42a2e977c"

      define_method(:install) do
        bin.install "fuse-v0.8.0-darwin-arm64" => "fuse"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.8.0/fuse-v0.8.0-linux-amd64"
      sha256 "02d4516ec348351c429b0321dda7d3f1ee57a88b39ea03ed5b84293d42ca7115"
      define_method(:install) do
        bin.install "fuse-v0.8.0-linux-amd64" => "fuse"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/fuse/releases/download/v0.8.0/fuse-v0.8.0-linux-arm64"
      sha256 "fd81114583948ba46fc5e94a918a2dca6051945fe471e16361900927c1352cc2"
      define_method(:install) do
        bin.install "fuse-v0.8.0-linux-arm64" => "fuse"
      end
    end
  end

  test do
    system "#{bin}/fuse", "version"
  end
end
