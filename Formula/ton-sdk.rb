class TonSdk < Formula
  desc "TONOS Client Library for TON DApp development"
  homepage "https://github.com/tonlabs/TON-SDK"
  license "Apache-2.0"
  url "https://github.com/tonlabs/TON-SDK.git",
    :tag => "1.5.2",
    :using => :git
  head "https://github.com/tonlabs/TON-SDK.git",
    :using => :git

  depends_on "rust" => :build

  def install
    cd "ton_client" do
        system "cargo build --release --target-dir target"
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
