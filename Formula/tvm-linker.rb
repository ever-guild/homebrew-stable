class TvmLinker < Formula
  desc "TVM linker takes TVM assembly source code of TON smart contract, compiles it and links its parts, adds standard selector and runtime and stores it into binary TVC file"
  homepage "https://github.com/tonlabs/TVM-linker"
  license "Apache-2.0"
  url "https://github.com/tonlabs/TVM-linker.git",
    :tag => "v0.2.1",
    :using => :git
  head "https://github.com/tonlabs/TVM-linker.git",
    :using => :git

  depends_on "rust" => :build

  def install
    cd "tvm_linker" do
        system "cargo test --release -- --nocapture --test-threads=1"
        system "cargo build --release"
        bin.install "target/release/tvm_linker" => "tvm-linke"
    end
  end

  test do
    system "tvm-linker", "--version"
  end
end
