# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A single bash-completion script for the [ack](http://beyondgrep.com/) CLI tool. The entire implementation lives in one file: `ack` (no extension — this is the completion script itself, not a build target). There is no build step, package manager, or test suite; the script is sourced directly by bash's `complete` mechanism.

The script works by shelling out to `ack --help-types` to discover the current installation's supported file types, then builds `compgen`-based completions for ack's flags, keyed off the previous word on the command line (e.g. `-t`/`-T`/`--type` complete against known ack types; flags that require a free-form argument like `--output` or `--pager` return no completions).

## Commands

All checks run as separate GitHub Actions workflows on every push (`.github/workflows/*.yml`). Run the same tools locally before committing:

```bash
# Shellcheck (config in .shellcheckrc: disables SC2148, SC2207, SC2086)
shellcheck ack

# Markdownlint (config in .markdownlint.json: dash-style lists, no line-length limit)
markdownlint README.md CONTRIBUTING.md

# EditorConfig conformance (rules in .editorconfig)
editorconfig-checker

# Spellcheck (aspell + pyspelling; config in .github/spellcheck.yml, custom words in .github/wordlist.txt)
pyspelling -c .github/spellcheck.yml
```

There is no automated test for the completion behavior itself — verify changes manually by sourcing the script and tab-completing, e.g.:

```bash
source ack
ack -<tab>
ack --type <tab>
```

## Editing conventions

- The `ack` script uses 4-space indentation per `.editorconfig`; Markdown files use 2-space indentation.
- New unfamiliar words used in `README.md`/`CONTRIBUTING.md` (proper nouns, tool names, etc.) must be added to `.github/wordlist.txt` or the spellcheck workflow will fail.
- Keep the `case $prev in ... esac` structure in the `_ack()` function as the place to add flags that take a non-completable or specially-completed argument; add all other plain flags to the `opts` accumulation above it.
- The `README.md` "History" section is a manually maintained changelog — update it when making a user-visible change to completion behavior, following the existing `major.minor.patch` bullet format.
