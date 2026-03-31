cask "displaybrightness" do
  version "1.0.0"
  sha256 "22efafb82cc97bf596935bf2c351a296490bdc77a7b8c1de80673c7fc48e59c1"

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
