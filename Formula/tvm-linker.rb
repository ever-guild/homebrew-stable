class TvmLinker < Formula
  desc "TVM assembly source code of TON smart contract, compiles it and links its parts"
  homepage "https://github.com/tonlabs/TVM-linker"
  url "https://github.com/tonlabs/TVM-linker.git",
      tag:      "0.15.31"
      revision: "e5223277d65e8b3813dc812b27d92ba762ec9104"
  version "210210.0829"
  license "Apache-2.0"
  head "https://github.com/tonlabs/TVM-linker.git"

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
