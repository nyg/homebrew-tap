# AGENTS.md

Homebrew tap (`nyg/tap`) for one formula (`Formula/jmxsh.rb`) and three casks (`Casks/`). Release updates are fully automated: an upstream release dispatches an `update-*` workflow here, which opens an `update-<package>-<version>` PR that CI tests and merges. Read [docs/automated-updates.md](docs/automated-updates.md) before touching any workflow or the shape of a formula or cask.

## Rules

- Version bumps belong to the update workflows. Edit a package by hand only for structural changes (caveats, zap, dependencies, install steps).
- The update workflows rewrite fields with `sed` and then `grep` for the result, so keep these lines single-line and literal: a cask's `version "x.y.z"` and `sha256 "<64 hex>"`, and the formula's `url "https://github.com/nyg/jmxsh/releases/download/..."`, `sha256 "<64 hex>"` and `depends_on "openjdk@NN"`. A reformatted line makes the next release fail.
- Leave the formula's `bottle do` block to `brew pr-pull` in `publish.yml`; it regenerates the block on every release.
- Every cask follows the same template: arm64-only DMG from the upstream release (`depends_on arch: :arm64`), a `postflight` that strips `com.apple.quarantine` because the apps are not notarized, and a caveat pointing at Open Anyway in System Settings → Privacy & Security. Copy an existing cask when adding one.
- Adding a package also means an update workflow with its own `repository_dispatch` type, the upstream release job that sends it, the README package table, and the tables in `docs/automated-updates.md`.
- Workflows that must trigger other workflows use `secrets.HOMEBREW_TAP_TOKEN`, since events from `GITHUB_TOKEN` trigger nothing downstream.

## Checks

CI runs `brew test-bot --only-tap-syntax`. Locally, with the tap checked out under `$(brew --repository)/Library/Taps/nyg/homebrew-tap`: `brew style nyg/tap` and `brew audit --tap nyg/tap`.
