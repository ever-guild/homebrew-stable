class TonosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.5.0",
      revision: "67ac6c085cd9fec3ba5d71da75e6c843bf856bad"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

  bottle do
    root_url "https://github.com/tonsoft/homebrew-stable/releases/download/tonos-cli-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina: "c27b33c36c1fc798beb449c3f77dc97672b494db264dbc4ca892f4676e4ab1a4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "51276ab6b4867bf7d7b3f87d8f5ea7eb55290f7adec859e8d848c2d39384d5d7"
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
