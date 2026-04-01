class GitVolume < Formula
  desc "Manage environment files across Git worktrees"
  homepage "https://github.com/laggu/git-volume"
  url "https://github.com/laggu/git-volume/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "43b6fe852e97d651ba77f02f4e0708e9b6b5b8aa5837810ac3a1dddde08a976d"
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
