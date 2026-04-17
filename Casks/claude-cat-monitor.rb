cask "claude-cat-monitor" do
  version "0.3.2"
  sha256 "68c8abdd6f6404102e2df9a42405f0ad02109d56c97d59b48e4047c0e4bf7e79"

  url "https://github.com/huangken8511429/claude-cat-island/releases/download/v#{version}/Claude.Cat.Monitor_#{version}_aarch64.zip"
  name "Claude Cat Monitor"
  desc "Pixel-art cat dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/huangken8511429/claude-cat-island"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Claude Cat Monitor.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Claude Cat Monitor.app"],
                   sudo: false
  end

  zap trash: [
    "~/.claude-cat-monitor",
  ]
end
