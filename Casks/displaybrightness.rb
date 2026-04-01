cask "displaybrightness" do
  version "1.2.3"
  sha256 "1a7195a78766efc19770e033931f2db517e831ab308df7a1b196e7cc66e0c1c4"

  url "https://github.com/sdemirbas/DisplaySettings/releases/download/v#{version}/DisplaySettings-#{version}.zip"
  name "DisplaySettings"
  desc "Menu bar app to control external display brightness via DDC/CI"
  homepage "https://github.com/sdemirbas/DisplaySettings"

  app "DisplaySettings.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/DisplaySettings.app"],
      sudo: false
  end

  zap trash: "~/Library/Preferences/com.displaySettings.DisplaySettings.plist"
end
