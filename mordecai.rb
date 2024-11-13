class Mordecai < Formula
  desc "CLI tool to link a local codebase to Mordecai"
  homepage "https://github.com/codeyarduk/mordecai"
  url "https://github.com/codeyarduk/mordecai/archive/refs/tags/v0.0.20.tar.gz"
  sha256 "1b095ea892e07c253ebbc9a14e4921c217a16ad17e46f5a001a44ac7bec57e77"
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
