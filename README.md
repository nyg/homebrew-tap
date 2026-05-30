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
| [jmxsh](https://github.com/nyg/jmxsh) | Command-line JMX client | `brew install nyg/tap/jmxsh` |

Formula updates go through `brew test-bot` (builds bottles) → `brew pr-pull` (uploads bottles to a GitHub Release and updates the `bottle` block).

### Casks

| Package | Description | Install |
|---------|-------------|---------|
| [QoQa Compta](https://github.com/nyg/qoqa-compta) | QoQa order accounting and invoice viewer | `brew install --cask nyg/tap/qoqa-compta` |

Cask updates only require the `.rb` file to be updated on `master`. No GitHub Release is created in this tap — Homebrew downloads the binary directly from the URL in the cask file (hosted in the upstream repo).

## Automated Updates

Formulas and casks in this tap are updated automatically when a new upstream release is published. See [docs/automated-updates.md](docs/automated-updates.md) for details.
