# frozen_string_literal: true

class Orphisme < Formula
  desc "Coordinate coding agents across local repositories"
  homepage "https://github.com/troll-master/orphisme"
  version "0.0.8"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/troll-master/homebrew-tap/releases/download/v0.0.8/orphisme-v0.0.8-macos_arm64"
      sha256 "2a74ec135e942794df3a3f13fd464b44b078fcfa37720da17a1fda823c298f64"
    end

    on_intel do
      url "https://github.com/troll-master/homebrew-tap/releases/download/v0.0.8/orphisme-v0.0.8-macos_x86_64"
      sha256 "112cdcd1a1d36497cf4ab3f13dbf6ac6316761aec68d706d1248eb692bfc8880"
    end
  end

  depends_on :macos
  depends_on "git"

  def install
    bin.install File.basename(stable.url) => "orphisme"
    chmod 0755, bin/"orphisme"

    notices = Utils.safe_popen_read(
      { "ORPHISME_INSTALL_DIR" => (buildpath/"notice-runtime").to_s },
      bin/"orphisme", "licenses"
    )
    raise "Missing embedded distribution notices" unless notices.include?("Orphisme distribution notices")

    pkgshare.mkpath
    (pkgshare/"LICENSES.txt").write notices
  end

  def caveats
    "Migrating from symphony-cli? Stop the old service and migrate settings, workspace marker and labels first; see docs/orphisme.md in the tap.\nSwitching from an Elixir build? Stop the old service before upgrading; keep settings and managed workspaces.\nRun orphisme setup, then orphisme check.\nGit, an authenticated Codex CLI and tracker credentials are required. Node.js is bundled.\nAfter an upgrade, run orphisme restart to use the new version.\nRunning work is preserved: restart refuses while work is active.\nStop Orphisme before brew uninstall orphisme.\nSettings, workspaces and legacy runtime caches are retained when uninstalling.\nLicense and attribution notices: orphisme licenses (also installed in share/orphisme/LICENSES.txt)."
  end

  test do
    ENV["ORPHISME_INSTALL_DIR"] = (testpath/"runtime").to_s
    ENV["ORPHISME_SETTINGS_FILE"] = (testpath/"settings.json").to_s
    assert_match "orphisme setup", shell_output("#{bin}/orphisme --help")
    assert_match "Orphisme distribution notices", (pkgshare/"LICENSES.txt").read
  end
end
