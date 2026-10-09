class Uji < Formula
  desc "Coding agent you can shape with Lua"
  homepage "https://github.com/uji-labs/uji"
  license "GPL-3.0-or-later"

  head do
    url "https://github.com/uji-labs/uji.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/uji-labs/uji/releases/download/v0.2.2/uji-aarch64-apple-darwin.tar.gz"
      sha256 "ce407f1579775311c034e2b7d554cbf1bedd490a2ece6a405c9e14247a031a93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/uji-labs/uji/releases/download/v0.2.2/uji-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "299b7f581e071f7d7d8e08109cd9e697d2562ceddcc9ae79edb59a407ba94e50"
    end

    on_arm do
      url "https://github.com/uji-labs/uji/releases/download/v0.2.2/uji-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b42f7c14e965f00d0f3aeafd7e075f0db8aa81f30508e012af2b6ae088748c6b"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args(path: "crates/uji")
    else
      bin.install "uji"
    end
  end

  test do
    assert_match(/^uji \d+\.\d+\.\d+$/, shell_output("#{bin}/uji --version"))
  end
end
