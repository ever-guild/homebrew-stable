class TvmLinker < Formula
  desc "TVM assembly source code of TON smart contract, compiles it and links its parts"
  homepage "https://github.com/tonlabs/TVM-linker"
  url "https://github.com/tonlabs/TVM-linker.git",
      revision: "977a0aa61ef100b6b221123fc44ab0f30b47cc84"
  version "210210.0829"
  license "Apache-2.0"
  head "https://github.com/tonlabs/TVM-linker.git"

  bottle do
    root_url "https://github.com/EverscaleGuild/homebrew-stable/releases/download/tvm-linker-210210.0829"
    sha256 cellar: :any_skip_relocation, catalina:     "bf28d100b45803fb357429d53aa9fd504a489071540d75218507a125fcae6a51"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "664e6677bd8cf01a77eb9100299304bce56a65760b35a095d9027d73bf3a3a15"
  end

  depends_on "rust" => :build

  def install
    cd "tvm_linker" do
      system "cargo", "test", "--release", "--", "--nocapture", "--test-threads=1"
      system "cargo", "install", *std_cargo_args
      bin.install_symlink bin/"tvm_linker" => "tvm-linker"
    end
  end

  test do
    system "tvm-linker", "--version"
  end
end
