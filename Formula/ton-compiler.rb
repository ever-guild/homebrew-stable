class TonCompiler < Formula
  desc "Clang compiler for Free TON Virtual Machine"
  homepage "https://github.com/tonlabs/ton-compiler/"
  url "https://github.com/tonlabs/ton-compiler.git",
      revision: "8cbffdd7da4f9ae78039fa0fa9615f7169b75e33"
  version "21.02.08"
  license "Apache-2.0"
  head "https://github.com/tonlabs/ton-compiler.git"

  depends_on "cmake" => :build
  depends_on "gcc@7" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "python"
  conflicts_with "tvm-linker", because: "provides this tool too"

  def install
    config = %W[
      -G Ninja
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -C #{buildpath}/cmake/Cache/ton-compiler.cmake
      -DCMAKE_BUILD_TYPE=Release
      ../llvm
    ]
    build = %W[
      -j#{ENV.make_jobs}
      --build .
      --target install-distribution
    ]
    Dir.mkdir("build")
    cd "build" do
      system "cmake", *config
      system "cmake", *build
    end
    bin.install_symlink bin/"tvm_linker" => "tvm-linker"
  end

  test do
    system "tvm-linker", "--version"
  end
end
