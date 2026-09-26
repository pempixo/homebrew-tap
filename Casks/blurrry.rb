cask "blurrry" do
  version "1.0"
  sha256 "3e20cb6136728e722668e63bb8330dbebc5ebcdc8e051fc644b25998eca56100"

  url "https://github.com/pempixo/blurrry/releases/download/v#{version}/blurrry.dmg"
  name "blurrry"
  desc "Blur everything but the app you're using"
  homepage "https://github.com/pempixo/blurrry"

  depends_on macos: ">= :sonoma"

  app "blurrry.app"

  # blurrry isn't notarized yet; clear the download quarantine so it opens normally.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/blurrry.app"]
  end

  uninstall quit: "com.dibronxer.blurrry"

  zap trash: "~/Library/Preferences/com.dibronxer.blurrry.plist"
end
