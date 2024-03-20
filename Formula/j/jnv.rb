class Jnv < Formula
  desc "JSON navigator and interactive filter leveraging jq"
  homepage "https://github.com/ynqa/jnv"
  url "https://github.com/ynqa/jnv/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "40fdb9de56d7ad55f7f3c52440ba7920f9aaffec07d59881b04e87a6facc5d28"
  license "MIT"
  head "https://github.com/ynqa/jnv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "jnv #{version}", shell_output("#{bin}/jnv --version").strip
  end
end
