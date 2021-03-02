class TonMsig < Formula
  desc "Tool for Free TON multi signature wallet"
  homepage "https://github.com/broxus/ton-msig"
  url "https://github.com/broxus/ton-msig.git",
      revision: "1225d147fc93e944b6deaeecf2629cdc77ed1777"
  version "1.0.4-rc-210205"
  license "Apache-2.0"
  head "https://github.com/broxus/ton-msig.git"

  depends_on "cmake" => :build
  depends_on "gcc@7" => :build
  depends_on "ninja" => :build
  depends_on "openssl@1.1"

  def install
    config = %w[
      -DCMAKE_BUILD_TYPE=Release
      -DBUILD_TESTING=OFF
      -DTON_USE_ROCKSDB=OFF
      -DTON_USE_ABSEIL=OFF
      -DTON_USE_GDB=OFF
      -DTON_USE_STACKTRACE=OFF
      -G Ninja
      ..
    ]
    Dir.mkdir("build")
    cd "build" do
      system "cmake", *config
      system "ninja", "-j#{ENV.make_jobs}"
      bin.install "bin/ton-msig" => "ton-msig"
    end
  end

  test do
    mnemonic = "dizzy modify exotic daring gloom rival pipe disagree again film neck fuel"
    output = shell_output("ton-msig generate --from '#{mnemonic}' | grep address | cut -d'\"' -f4")
    expect = "0:670A0F537CBDDCE5FE25BDCFF052258BD2ECFF8F2CB01E25ECB96736CFF04B41"
    assert_match expect, output
  end
end
