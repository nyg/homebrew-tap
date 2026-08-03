# homebrew-tap

Homebrew tap for [nyg](https://github.com/nyg) packages.

## Usage

```sh
brew tap nyg/tap
```

## Packages

### Formulas

| Package | Description | Install |
|---------|-------------|---------|
| [jmxsh](https://github.com/nyg/jmxsh) | Command-line JMX client for monitoring and managing Java applications | `brew install nyg/tap/jmxsh` |

`jmxsh` installs the upstream `jmxsh-<version>.jar` behind a launcher script and
depends on `openjdk@25`. Bottles are built by this tap's CI and attached to a
release here; the JAR itself is downloaded from the upstream repository.

### Casks

| Package | Installed app | Description | Install |
|---------|---------------|-------------|---------|
| [crypto-tools](https://github.com/nyg/crypto-tools) | `Crypto Tools.app` | Cryptocurrency tools for Binance and Kraken | `brew install --cask nyg/tap/crypto-tools` |
| [qoqa-compta](https://github.com/nyg/qoqa-compta) | `QoQa Compta.app` | QoQa order accounting and invoice viewer | `brew install --cask nyg/tap/qoqa-compta` |
| [wiktionary-to-kindle](https://github.com/nyg/wiktionary-to-kindle) | `Wiktionary to Kindle.app` | Converts Wiktionary data into Kindle-compatible MOBI dictionaries | `brew install --cask nyg/tap/wiktionary-to-kindle` |

Each cask installs from a `<package>-<version>-macos-arm64.dmg` asset published
on the upstream repository's GitHub release. Those DMGs are built on Apple
Silicon runners, so they are **arm64-only**: the casks refuse to install on
Intel Macs rather than leaving behind an app that cannot launch.

The apps are ad-hoc signed but not notarized. Homebrew quarantines them on
install, which makes Gatekeeper report them as "damaged", so each cask strips
the quarantine attribute in a `postflight` step. If macOS still blocks the first
launch, right-click the app and select Open.

Windows builds of the same apps are packaged in
[nyg/scoop-bucket](https://github.com/nyg/scoop-bucket).

## Automated Updates

Formulas and casks in this tap are updated automatically when a new upstream release is published. See [docs/automated-updates.md](docs/automated-updates.md) for details.
