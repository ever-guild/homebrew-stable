class TonosCli < Formula
  desc "Command line tool for TON OS"
  homepage "https://github.com/tonlabs/tonos-cli"
  license "Apache-2.0"
  url "https://github.com/tonlabs/tonos-cli.git",
    :tag => "v0.2.0",
    :using => :git
  head "https://github.com/tonlabs/tonos-cli.git",
    :using => :git

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/tonos-cli --version")
    assert_match "#{version}", output
  end
end
