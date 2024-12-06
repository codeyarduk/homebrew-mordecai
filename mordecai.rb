class Mordecai < Formula
  desc "CLI tool to link a local codebase to Mordecai"
  homepage "https://github.com/codeyarduk/mordecai"
  url "https://github.com/codeyarduk/mordecai/archive/refs/tags/v0.0.35.tar.gz"
  sha256 "516778055710e5173e7413e8d65d0166849357ecc68f106317e8b148cb3570b7"
  license "MIT"

  depends_on "go" => :build

  def install
    cd "cmd/mordecai" do
      system "go", "build", "-o", "mordecai"
      bin.install "mordecai"
    end
  end
  test do
    assert_match "No active session found.", shell_output("#{bin}/mordecai logout")
  end
end
