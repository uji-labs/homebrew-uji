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
      url "https://github.com/uji-labs/uji/releases/download/v0.2.3/uji-aarch64-apple-darwin.tar.gz"
      sha256 "7a9d3b0843b4990f9b0eb0a5d305e80639527b724e4bb68c7e022aa9456bc8f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/uji-labs/uji/releases/download/v0.2.3/uji-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8afc6d5aa717bee1e98a51754c11d3ade1efabcf075194613dd703b311841260"
    end

    on_arm do
      url "https://github.com/uji-labs/uji/releases/download/v0.2.3/uji-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb35aba32be103cde36687d43b34b71fbf97cefa051c8a2126e94159fc568a15"
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
