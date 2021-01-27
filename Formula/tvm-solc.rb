class TvmSolc < Formula
  desc "Solidity compiler for Free TON Virtual Machine"
  homepage "https://github.com/tonlabs/TON-Solidity-Compiler"
  url "https://github.com/tonlabs/TON-Solidity-Compiler.git",
      tag:      "0.25",
      revision: "f6cd9bb83439a0e4987155f18d52afe55de1275a"
  license "Apache-2.0"
  head "https://github.com/tonlabs/TON-Solidity-Compiler.git"

  depends_on "boost" => :build
  depends_on "cmake" => :build

  def install
    cd "compiler" do
      system "cmake",
        "-DUSE_CVC4=OFF",
        "-DUSE_Z3=OFF",
        "-DTESTS=ON",
        "-DSOLC_LINK_STATIC=ON",
        "-DCMAKE_BUILD_TYPE=Release"
      system "make",
       "-j#{ENV.make_jobs}",
       "solc"
      bin.install "solc/solc" => "tvm-solc"
    end
  end

  test do
    system "tvm-solc", "--version"
  end
end
