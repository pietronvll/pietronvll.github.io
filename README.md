# pietronvll.github.io

Local website development uses `uvx blag` for the site build and `typst` for the CV build.

## Commands

- `make cv` rebuilds `static/CV/CV_Novelli.pdf` and syncs `build/CV/`.
- `make site` rebuilds the website with `uvx blag build`.
- `make build` runs the CV build and then the website build.
- `make preview` starts the local dev server with `uvx blag serve`.
- `make deploy` builds everything, creates a dated commit, and pushes it.

## Fresh clone hooks

Enable the tracked pre-commit hook with:

```sh
git config core.hooksPath .githooks
```
