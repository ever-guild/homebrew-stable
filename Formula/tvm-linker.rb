class TvmLinker < Formula
  desc "TVM assembly source code of TON smart contract, compiles it and links its parts"
  homepage "https://github.com/tonlabs/TVM-linker"
  url "https://github.com/tonsoft/TVM-linker.git",
      tag:      "v0.2.1-head-2001271811",
      revision: "11f66ec619656b74d146116ada27b11ceedde658"
  license "Apache-2.0"
  head "https://github.com/tonlabs/TVM-linker.git"

  bottle do
    root_url "https://github.com/tonsoft/homebrew-stable/releases/download/tvm-linker-2001271811"
    cellar :any_skip_relocation
    sha256 "dd85e257e1389020e1228e43a6460027004dc094c5880c6e8af691de878e1ecb" => :catalina
    sha256 "42125087a57be248595746581e4ccf047b678a4263cde71d0ff38878a3721886" => :x86_64_linux
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
