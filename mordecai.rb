class Mordecai < Formula
  desc "CLI tool to link a local codebase to Mordecai"
  homepage "https://github.com/codeyarduk/mordecai"
  url "https://github.com/codeyarduk/mordecai/archive/refs/tags/v0.0.27.tar.gz"
  sha256 "c3760652d50963a2720fae0e69f9414755d288aa7c96dc278953364dcc1d7490"
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
