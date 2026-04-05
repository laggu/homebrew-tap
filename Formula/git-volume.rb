class GitVolume < Formula
  desc "Manage environment files across Git worktrees"
  homepage "https://github.com/laggu/git-volume"
  url "https://github.com/laggu/git-volume/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "48e5a939c6c6bffbc69d7cdc983149af8b8371e3d9de2ec8defa9b7c67af5a9d"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    ldflags = [
      "-s -w",
      "-X github.com/laggu/git-volume/cmd.version=#{version}",
      "-X github.com/laggu/git-volume/cmd.commit=e5c31802439af045affa073902fcdc8f0f5d633b",
      "-X github.com/laggu/git-volume/cmd.date=2026-04-05T15:22:20+09:00",
    ].join(" ")

    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    output = shell_output("#{bin}/git-volume version")

    assert_includes output, version.to_s
    assert_includes output, "commit: e5c31802439af045affa073902fcdc8f0f5d633b"
    assert_includes output, "built:  2026-04-05T15:22:20+09:00"
  end
end
