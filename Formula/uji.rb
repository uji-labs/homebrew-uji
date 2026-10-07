class Uji < Formula
  desc "Coding agent you can shape with Lua"
  homepage "https://github.com/uji-labs/uji"
  url "https://github.com/uji-labs/uji/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "6fb99fb87aed03fa4b9dc07ee06a9d980bb04eaace8e5f7c2ea8c41a5f5d211f"
  license "GPL-3.0-or-later"
  head "https://github.com/uji-labs/uji.git", branch: "main"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/uji")
  end

  test do
    assert_match(/^uji \d+\.\d+\.\d+$/, shell_output("#{bin}/uji --version"))
  end
end
