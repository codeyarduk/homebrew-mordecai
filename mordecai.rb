class Mordecai < Formula
  desc "CLI tool to link a local codebase to Mordecai"
  homepage "https://github.com/codeyarduk/mordecai"
  url "https://github.com/codeyarduk/mordecai/archive/refs/tags/v0.0.21.tar.gz"
  sha256 "9fc387a0f7183c73aba0d8d28fe04697b118eb495b98f1b043898c50451c69dd"
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
