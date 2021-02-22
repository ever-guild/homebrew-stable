class TonosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.6.0",
      revision: "49e78c7c616b693b3ee06b62bb5bc136258c761b"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

  bottle do
    root_url "https://github.com/tonsoft/homebrew-stable/releases/download/tonos-cli-0.5.0"
    sha256 cellar: :any_skip_relocation, catalina:     "52fb0b930cbd4cb1aa16f266b95adfc8e223039349c3bc72b76e65044c8db1d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fba938c27f5ee3f3df8c9b7b5d1f81621057b9fb0980e3bbccd7f69cd49e4bd9"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("tonos-cli --version")
    assert_match @version.to_s, output
  end
end
