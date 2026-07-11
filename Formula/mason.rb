# typed: false
# frozen_string_literal: true

class Mason < Formula
  desc "Model-agnostic coding agent with the prism code graph baked in"
  homepage "https://github.com/provasign/mason"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/mason/releases/download/v0.1.0/mason-v0.1.0-darwin-amd64"
      sha256 "440a4596d822748b9dbd905bb51d1da9483484991776e6982a70f6719684d0ea"

      define_method(:install) do
        bin.install "mason-v0.1.0-darwin-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/mason/releases/download/v0.1.0/mason-v0.1.0-darwin-arm64"
      sha256 "952cbdddeb3df0024ce60b3df26b9853359febb47f29dc7ccbe0b6146698c351"

      define_method(:install) do
        bin.install "mason-v0.1.0-darwin-arm64" => "mason"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.1.0/mason-v0.1.0-linux-amd64"
      sha256 "b14e16dd69fbc7f8441a385b7a4f70d85e0e9941b7e32043e52b7f46fb885a3a"
      define_method(:install) do
        bin.install "mason-v0.1.0-linux-amd64" => "mason"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/mason/releases/download/v0.1.0/mason-v0.1.0-linux-arm64"
      sha256 "47663419ff000dfefe3445f9b6ca1693efaf1f13278f3646af4475d1696480c9"
      define_method(:install) do
        bin.install "mason-v0.1.0-linux-arm64" => "mason"
      end
    end
  end

  test do
    system "#{bin}/mason", "version"
  end
end
