# Homebrew tap

Homebrew distribution repository for tools maintained by
[troll-master](https://github.com/troll-master).

## Install Orphisme

Orphisme v0.1.3 supports macOS on Apple Silicon (ARM64) and Intel (x86_64).
Linux distribution is not available.

```sh
brew install troll-master/tap/orphisme
orphisme --help
orphisme setup
```

Downloads use the [public binaries in this Tap's Releases](https://github.com/troll-master/homebrew-tap/releases)
and Homebrew's standard HTTPS downloader with SHA-256 verification. No GitHub login,
invitation or download token is required. Erlang/OTP and Elixir are bundled.
To run tasks, install and authenticate the Codex CLI and configure tracker credentials.
Git is installed as a Formula dependency.

See [installation, setup, migration and uninstall](docs/orphisme.md).
If an old manual or private-Tap installation exists, stop that service and follow the
migration guide before installing. Preserve its settings and managed workspaces.

## Update

```sh
brew update
brew upgrade troll-master/tap/orphisme
```

After active tasks finish, run `orphisme restart` to start using the new version.
The service refuses to restart while work is active. Settings, repository registrations,
workspaces and older extracted runtimes are retained.

## Distribution layout

- `Formula/orphisme.rb` selects the binary for the Mac's CPU and verifies its SHA-256.
- `docs/orphisme.md` explains installation, configuration and lifecycle commands.
- Each Orphisme Release here contains two macOS executables and their two checksum files.
- Source and release records remain in private [troll-master/orphisme](https://github.com/troll-master/orphisme).
  Source access is not required to download or install binaries.

The binaries do not have an Apple Developer ID signature or Apple notarization.
Apple Silicon binaries retain the required ad-hoc signature. Read bundled license and
attribution notices with `orphisme licenses`; Homebrew also installs them under
`$(brew --prefix orphisme)/share/orphisme/LICENSES.txt`.

## Maintainers

Verify both CPU builds, CLI lifecycle checks and upgrades before publishing a new version.
Upload the same verified binaries to the source Release and a new public Release here,
then use the source repository's Homebrew publisher with this Tap as `--release-repository`.
The publisher verifies public assets anonymously and proposes a Formula and guide PR.
Review and merge that PR manually; it never pushes directly to main or auto-merges.
This shared README is maintained separately from generated Formulae and guides.

Keep existing tags and Releases unchanged. Public binary tags use this Tap's own history;
private source history is not imported. Other tools' Formulae and shared catalog entries
must be preserved during future updates.
