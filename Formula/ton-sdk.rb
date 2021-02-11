class TonSdk < Formula
  desc "Client Library for Free TON DApp development"
  homepage "https://github.com/tonlabs/ton-sdk"
  url "https://github.com/tonlabs/ton-sdk.git",
      revision: "ef19c55cc74d80b94b7af89b897b6e576d6eccb6"
  version "1.7.0"
  license "Apache-2.0"
  head "https://github.com/tonlabs/ton-sdk.git"

  depends_on "rust" => :build

  def install
    cd "ton_client" do
      system "cargo", "build", "--release", "--target-dir", "target"
      include.install "tonclient.h"
      on_macos do
        lib.install "target/release/libton_client.dylib"
      end
      on_linux do
        lib.install "target/release/libton_client.so"
      end
    end
  end
end
