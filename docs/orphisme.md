# Orphisme CLI — installation and updates

## Migrating from Symphony CLI

This is a new Formula, `orphisme`; upgrading `symphony-cli` does not switch names.
Before starting Orphisme, stop the old service with `symphony stop` and back up its settings
and management workspace. Move the old `symphony` configuration directory to `orphisme`
under the same XDG config directory (default `~/.config`), without overwriting an existing destination.
If you used `SYMPHONY_SETTINGS_FILE`, instead set `ORPHISME_SETTINGS_FILE` to the same file.
Rename the management root's `.symphony-workspace.json` marker to `.orphisme-workspace.json`.
Keep the management root, registry, repository IDs and worktree paths unchanged.

Update `SYMPHONY_*` environment variables to `ORPHISME_*` and each repository's `WORKFLOW.md`:
use `orphisme-git`, the `orphisme` label and `orphisme:model:*` / `orphisme:complexity:*` labels.
Rename those labels in your tracker too. Use `/orphisme retry`, `/orphisme status` and `/orphisme steer`.
Old `symphony/gh-*` PR branches should be managed through their linked Issues.
Run `orphisme check` and verify `orphisme list` before starting the service.
Never run both services against the same management workspace.
After verification, the stopped old Formula can be removed with `brew uninstall symphony-cli`.

## Install with Homebrew

This guide is generated for the selected source repository, public binary host and Tap.
Orphisme’s initial public release supports macOS on Apple Silicon (ARM64) and Intel (x86_64).
Linux support is deferred. With Homebrew installed on macOS:

```sh
brew install troll-master/tap/orphisme
orphisme --help
orphisme setup
```

No Tap invitation, GitHub login or download token is required. The Formula uses
normal HTTPS downloads from fixed [Orphisme Release URLs](https://github.com/troll-master/homebrew-tap/releases)
and verifies SHA-256. Erlang/OTP and Elixir are bundled; mise and Zig are not required.

Before running tasks, install Git and the Codex CLI, authenticate Codex, and configure
tracker credentials in your repository's `WORKFLOW.md`. Homebrew installs Git as a
runtime dependency. The optional `tracker.provider.use_gh_auth: true` setting needs
GitHub CLI: install `gh` and run `gh auth login` if you choose it. Otherwise configure
a tracker token. `gh` is not needed to download Orphisme. See the
[configuration guide](https://github.com/troll-master/orphisme/blob/main/docs/configuration.md).
Run `orphisme check` after configuration; missing credentials or registration are
setup failures to resolve, not reasons to authenticate the binary download.

Alternatively, download the binaries from the [public Releases](https://github.com/troll-master/homebrew-tap/releases).
The [developer source build instructions](https://github.com/troll-master/orphisme/blob/main/docs/installation.md)
and configuration guide may require access to the source repository. Binary downloads do not.

If an earlier manual installation of `orphisme` is on PATH, stop that service
using the old executable first. Remove or move that specific old symlink before
installing with Homebrew; do not use `brew link --overwrite` blindly.
Use `type -a orphisme` to confirm which installation will run.

## Switching from the original private Tap

The public Tap is a separate repository with new history. The original private
repositories and their tags and Releases remain unchanged and are not copied here.
`brew update` does not switch an existing private-Tap installation to this Tap.
Stop using the old executable, record its version and back up settings, then
uninstall its old Formula and install `troll-master/tap/orphisme`. Keep settings and
managed workspaces. Check `type -a orphisme`, `orphisme list` and `orphisme check`
before starting the new service. Never run both against the same workspace.

## Upgrade

```sh
brew update
brew upgrade troll-master/tap/orphisme
orphisme restart
```

The shipped binaries retain older extracted runtimes, so installing or invoking
a newer CLI does not remove files used by a running service. The service keeps
its current version until restarted. Restart refuses while work is active;
wait for that work to finish and retry. Old runtime caches are intentionally
retained; do not remove them while a service is running.

## Uninstall

```sh
orphisme stop
# Continue only after stop succeeds.
brew uninstall orphisme
```

Settings, repository registrations, workspaces and runtime caches remain on disk.

## Download and authentication problems

Public downloads do not use `gh auth login`. If a download returns 404, confirm the
selected public repository and stable release exist. Run `brew update` for this
public Tap. If an installation still requests download authentication, check its
origin with `brew info orphisme` and use the explicit private-Tap switch above.
Old pinned Formulae continue to refer to the original private Releases.
For tracker access failures, check the credentials configured in `WORKFLOW.md`;
when using `use_gh_auth`, check `gh auth status` as the service user.

## Licenses and attribution

The standalone executable embeds the project LICENSE and NOTICE (including OpenAI
Symphony attribution and the modified-project disclaimer) and reviewed notices for
its bundled dependencies and runtime. Read them with `orphisme licenses`.
Homebrew also installs the same output to
`$(brew --prefix orphisme)/share/orphisme/LICENSES.txt`; installation extracts the
runtime into a temporary build directory and does not configure or start the service.
The four Release assets remain two macOS executables and their SHA-256 files.
