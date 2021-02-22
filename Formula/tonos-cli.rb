class TonosCli < Formula
  desc "Command-line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  url "https://github.com/tonlabs/tonos-cli.git",
      tag:      "v0.6.0",
      revision: "49e78c7c616b693b3ee06b62bb5bc136258c761b"
  license "Apache-2.0"
  head "https://github.com/tonlabs/tonos-cli.git"

  bottle do
    root_url "https://github.com/tonsoft/homebrew-stable/releases/download/tonos-cli-0.6.0"
    sha256 cellar: :any_skip_relocation, catalina:     "16d8784f1b82355e484c1c7f4a02376748b8993dc85d35f990a14b7d60c50e74"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0a72945e2807aeb82bed5cfa2b238839d6c0fbd4604767b61992220d39b8f57e"
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
