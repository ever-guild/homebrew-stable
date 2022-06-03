class EverosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.26.27",
      revision: "6e33c878eacc78b4e7fa6064c9028c507ec4928e"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", *std_cargo_args
    bin.install_symlink bin/"tonos-cli" => "everos-cli"
    bin.install_symlink bin/"tonos-cli" => "ever"
  end

  test do
    output = shell_output("tonos-cli --version")
    output = shell_output("everos-cli --version")
    output = shell_output("ever --version")
    assert_match @version.to_s, output
  end
end
