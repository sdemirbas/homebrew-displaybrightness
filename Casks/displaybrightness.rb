cask "displaybrightness" do
  version "1.2.0"
  sha256 "adb5aac2b4ac936685f6eecacf444c0ddba7b47192b57b6965feaa61b445a44f"

  url "https://github.com/sdemirbas/DisplaySettings/releases/download/v#{version}/DisplaySettings-#{version}.zip"
  name "BarDis"
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
