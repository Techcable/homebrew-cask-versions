cask "dropbox-beta" do
  arch = Hardware::CPU.intel? ? "" : "&arch=arm64"

  version "141.3.3144"

  if Hardware::CPU.intel?
    sha256 "29c18da465a3e4a22dffbfc022f328bb3a684cc5644463082f2498725c13cd5f"
  else
    sha256 "225cd42b2f0269c74ce98842cc495d299a5cdb75da7ba5882ca541873275dabd"
  end

  url "https://www.dropbox.com/download?build=#{version}&plat=mac&type=full#{arch}",
      verified: "dropbox.com/"
  name "Dropbox"
  desc "Client for the Dropbox cloud storage service"
  homepage "https://www.dropboxforum.com/t5/Desktop-client-builds/bd-p/101003016"

  livecheck do
    url :homepage
    regex(/Beta\sBuild\s(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  conflicts_with cask: "dropbox"

  app "Dropbox.app"

  uninstall launchctl: "com.dropbox.DropboxMacUpdate.agent"

  zap trash: [
    "/Library/DropboxHelperTools",
    "~/.dropbox",
    "~/Library/Application Scripts/com.dropbox.foldertagger",
    "~/Library/Application Scripts/com.getdropbox.dropbox.garcon",
    "~/Library/Application Support/Dropbox",
    "~/Library/Caches/CloudKit/com.apple.bird/iCloud.com.getdropbox.Dropbox",
    "~/Library/Caches/com.dropbox.DropboxMacUpdate",
    "~/Library/Caches/com.getdropbox.dropbox",
    "~/Library/Caches/com.getdropbox.DropboxMetaInstaller",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.dropbox.DropboxMacUpdate",
    "~/Library/Containers/com.dropbox.foldertagger",
    "~/Library/Containers/com.getdropbox.dropbox.garcon",
    "~/Library/Dropbox",
    "~/Library/Group Containers/com.getdropbox.dropbox.garcon",
    "~/Library/LaunchAgents/com.dropbox.DropboxMacUpdate.agent.plist",
    "~/Library/Logs/Dropbox_debug.log",
    "~/Library/Preferences/com.dropbox.DropboxMacUpdate.plist",
    "~/Library/Preferences/com.dropbox.DropboxMonitor.plist",
    "~/Library/Preferences/com.dropbox.tungsten.helper.plist",
    "~/Library/Preferences/com.getdropbox.dropbox.plist",
  ]
end
