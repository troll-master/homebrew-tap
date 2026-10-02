# Homebrew tap

Homebrew distribution repository for tools maintained by
[troll-master](https://github.com/troll-master).

## Status

This repository is being prepared for public distribution and is currently
private. It does not yet contain an installable Formula. Orphisme's initial version
is **0.1.0** (`v0.1.0`), and its macOS Release assets have been prepared in the private
source repository. **Public downloads and Homebrew installation are not yet available.**

The selected source repository is
[troll-master/orphisme](https://github.com/troll-master/orphisme), which is also
currently private. The Homebrew tap name is `troll-master/tap`.
After both repositories are public, the Formula is merged, and anonymous installation
has been verified, the installation command will be `brew install troll-master/tap/orphisme`.
Wait for the maintainers' availability announcement before running it.

## Distribution layout

The first verified Orphisme release will add:

- `Formula/orphisme.rb`: a Formula with fixed source Release URLs and verified
  SHA-256 checksums.
- `docs/orphisme.md`: installation, setup, upgrade and uninstall instructions.

Executables and their checksum files belong to the source repository's Release,
not this tap. The initial Orphisme release targets macOS on Apple Silicon (ARM64) and Intel
(x86_64). Linux support is deferred.
Downloads will use Homebrew's standard HTTPS downloader without a GitHub login or
download token. Running Orphisme will require Git, an authenticated Codex CLI and
tracker credentials, as described in the future tool guide.

## Before the first public distribution

1. Obtain approval to make the source repository and this tap public, then verify
   both are anonymously readable.
2. Verify the prepared `v0.1.0` source Release contains the tested two macOS
   executables and their two checksum files. Confirm the tag is `v0.1.0` and the
   embedded version is `0.1.0`, then verify anonymous asset downloads after publication.
3. Use the source project's maintained
   [Homebrew release procedure](https://github.com/troll-master/orphisme/blob/main/docs/private-homebrew.md)
   and `scripts/publish-homebrew.py`, explicitly selecting
   `troll-master/orphisme` as the source and `troll-master/homebrew-tap` as the tap.
   The publisher requires a public tap and anonymously verifies the public stable
   source Release and its assets before pushing a dedicated
   `homebrew/orphisme/vX.Y.Z` branch and opening or reusing a PR to `main`.
   The Tap token needs Contents and Pull requests read/write access; checking or
   changing existing token permissions is a separate administrator action.
4. Review the PR's latest head, the current `main` version, URLs, checksums and
   diff, then manually merge it. The publisher never pushes directly to protected
   `main`, force-pushes, or merges automatically. Retries reuse the proposal and
   stop if it contains manual changes. Withdraw stale proposals if a newer
   release has already been distributed.
5. Verify Homebrew fetch, checksum validation, installation and CLI behavior in
   clean environments without GitHub credentials or pre-existing download caches.
   Record the results for each supported platform.
6. Update this README's preparation status and add verified installation and
   update instructions. The publisher preserves an existing README, so this
   shared catalog must be updated separately.

This tap starts with new Git history. Prior private repository history, tags,
Release assets and custom downloaders are not imported. Future tool publications
should update their own Formula and guide while preserving other tools and this
shared README.
