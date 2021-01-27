class TonosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.2.0",
      revision: "5eed060d15e4faf2da2bc4ec6f73b3d32007b4a8"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

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
