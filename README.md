# homebrew-wavecrest

Homebrew tap for [wavecrest](https://github.com/doyled-it/wavecrest) — Wave Terminal companion for AI coding agents.

## Install

```bash
brew install doyled-it/wavecrest/wavecrest
```

After install:

```bash
wavecrest install        # claude hooks + wave widget + launchd
# in a fresh Wave terminal block (not inside tmux):
wavecrest auth-set
# restart Wave and drag the wavecrest widget into a block
wavecrest doctor         # verify setup
```

## Update

```bash
brew update
brew upgrade wavecrest
```

## Uninstall

```bash
wavecrest uninstall --purge
brew uninstall wavecrest
brew untap doyled-it/wavecrest
```
