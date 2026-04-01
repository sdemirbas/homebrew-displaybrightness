cask "displaybrightness" do
  version "1.2.1"
  sha256 "76ee893a2c4f94400aaafb5166e56949f24b1ed33f4d9b860d4f2c80996a286a"

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
