class Mordecai < Formula
  desc "CLI tool to link a local codebase to Mordecai"
  homepage "https://github.com/codeyarduk/mordecai"
  url "https://github.com/codeyarduk/mordecai/archive/refs/tags/v0.0.29.tar.gz"
  sha256 "80d037091e99d75a1fc573294663e0d99cd3bcb0d7ad2525473aef95d71dddea"
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
