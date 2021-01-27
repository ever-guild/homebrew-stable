class TonosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.2.0",
      revision: "5eed060d15e4faf2da2bc4ec6f73b3d32007b4a8"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

  bottle do
    root_url "https://github.com/tonsoft/homebrew-stable/releases/download/tonos-cli-0.2.0"
    cellar :any_skip_relocation
    sha256 "d1f1f963c2d5679e7dcd85e61171ee7e869544a843dc6aa6099e0f2a35bd5ec9" => :catalina
    sha256 "5a0142008107e12830b4d6c2d02792225f0a3eba0b8c8cfb94cbfcedc07c82f5" => :x86_64_linux
  end

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/tonos-cli --version")
    assert_match @version.to_s, output
  end
end
