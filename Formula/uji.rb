class Uji < Formula
  desc "Coding agent you can shape with Lua"
  homepage "https://github.com/uji-labs/uji"
  url "https://github.com/uji-labs/uji/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6d06b2e7414b73bb6f28b96766cb81bb60d9a45ab82721af732d58a93a3b1bd7"
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
