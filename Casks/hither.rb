cask "hither" do
  version "0.1.1"
  sha256 "669dbe78eda1ff4f46ab1be3aa5606106e12683344599f3079fb71a896804166"

  url "https://github.com/erenbekman/hither/releases/download/v#{version}/Hither_#{version}_aarch64.dmg"
  name "Hither"
  desc "PRs, deploys and agents in the menu bar"
  homepage "https://erenbekman.github.io/hither/"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"
  auto_updates true

  app "Hither.app"

  uninstall quit: "dev.hither.app"

  zap trash: [
    "~/Library/Application Support/dev.hither.app",
    "~/Library/Caches/dev.hither.app",
    "~/Library/WebKit/dev.hither.app",
  ]

  caveats <<~EOS
    If you installed the Claude Code hooks, remove them first from
    Hither → Settings → Claude Code → Remove hooks.
    Tokens stay in your login Keychain under the service "dev.hither.app".
  EOS
end
