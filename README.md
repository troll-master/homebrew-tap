# Homebrew tap

Homebrew distribution repository for tools maintained by
[troll-master](https://github.com/troll-master).

## Status

This repository is being prepared for public distribution and is currently
private. It does not yet contain an installable Formula. Orphisme's first public
release version has not been selected, and no public release assets are available.

The planned source repository is
[troll-master/orphisme](https://github.com/troll-master/orphisme), which is also
currently private. The Homebrew tap name will be `troll-master/tap`.
Installation instructions will be added after public release verification.

## Distribution layout

The first verified Orphisme release will add:

- `Formula/orphisme.rb`: a Formula with fixed source Release URLs and verified
  SHA-256 checksums.
- `docs/orphisme.md`: installation, setup, upgrade and uninstall instructions.

Executables and their checksum files belong to the source repository's Release,
not this tap. The planned targets are macOS and Linux, each on ARM64 and x86_64.
Downloads will use Homebrew's standard HTTPS downloader without a GitHub login or
download token. Running Orphisme will require Git, an authenticated Codex CLI and
tracker credentials, as described in the future tool guide.

## Before the first public distribution

1. Obtain approval to make the source repository and this tap public, then verify
   both are anonymously readable.
2. Select the initial stable version using the source project's release rules
   and generator constraints. Publish a tested source Release containing the
   four target executables and their four checksum files.
3. Use the source project's maintained
   [Homebrew release procedure](https://github.com/troll-master/orphisme/blob/main/docs/private-homebrew.md)
   and `scripts/publish-homebrew.py`, explicitly selecting
   `troll-master/orphisme` as the source and `troll-master/homebrew-tap` as the tap.
   The publisher requires a public tap and anonymously verifies the public stable
   source Release and its assets before updating the Formula and tool guide.
4. Verify Homebrew fetch, checksum validation, installation and CLI behavior in
   clean environments without GitHub credentials or pre-existing download caches.
   Record the results for each supported platform.
5. Update this README's preparation status and add verified installation and
   update instructions. The publisher preserves an existing README, so this
   shared catalog must be updated separately.

This tap starts with new Git history. Prior private repository history, tags,
Release assets and custom downloaders are not imported. Future tool publications
should update their own Formula and guide while preserving other tools and this
shared README.
