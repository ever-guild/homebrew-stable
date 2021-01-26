class TvmSolc < Formula
  desc "Solidity compiler for Free TON Virtual Machine"
  homepage "https://github.com/tonlabs/TON-Solidity-Compiler"
  license "Apache-2.0"
  url "https://github.com/tonlabs/TON-Solidity-Compiler.git",
    :tag => "0.25",
    :using => :git
  head "https://github.com/tonlabs/TON-Solidity-Compiler.git",
    :using => :git

  depends_on "cmake" => :build
  depends_on "boost" => :build

  def install
    system "mkdir build"
    cd "build" do
        system "cmake ../compiler/ -DCMAKE_BUILD_TYPE=Release -DUSE_CVC4=OFF -DUSE_Z3=OFF -DTESTS=ON -DSOLC_LINK_STATIC=ON"
        system "make solc -j $(nproc)"
        bin.install "solc/solc" => "tvm-solc"
    end
  end

  test do
    system "tvm-solc", "--version"
  end
end
