class GitVolume < Formula
  desc "Manage environment files across Git worktrees"
  homepage "https://github.com/laggu/git-volume"
  url "https://github.com/laggu/git-volume/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "43d17349957bad75fb5a95ce1166bb55f4ac3760d37de045bb449491b8abb2f9"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/laggu/git-volume/cmd.version=#{version}"

    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-volume version")
  end
end
