# Zed AppleScript Extension

AppleScript language support for the [Zed](https://zed.dev) editor.

Provides syntax highlighting, bracket matching, auto-indentation, and outline
navigation for `.applescript`, `.scpt`, and `.scptd` source files, powered by
[`waddie/tree-sitter-applescript`](https://github.com/waddie/tree-sitter-applescript).

## Features

- Syntax highlighting (keywords, strings, numbers, comments, handlers, properties, operators, comparison phrases)
- Handler / script object / property outline (`cmd-shift-O`)
- Auto-indent for `tell` / `if` / `repeat` / `try` / `on` / `script` blocks
- Bracket and quote auto-close

## Install (from source)

This extension is not yet published to the Zed extension registry. To install
it locally:

1. Clone this repository.
2. In Zed, open the command palette (`cmd-shift-P`) and run
   **`zed: install dev extension`**.
3. Select the cloned directory.

Zed will fetch the tree-sitter grammar, build it to WebAssembly, and register
the language. Re-run `zed: install dev extension` after editing any file to
reload.

## File associations

| Suffix        | Language    |
| ------------- | ----------- |
| `.applescript`| AppleScript |
| `.scpt`       | AppleScript |
| `.scptd`      | AppleScript |

## Layout

```
extension.toml                     # extension manifest + grammar pin
languages/applescript/
  config.toml                      # language config (suffixes, comments, brackets)
  highlights.scm                   # syntax highlighting queries
  brackets.scm                     # bracket pair queries
  indents.scm                      # indentation queries
  outline.scm                      # outline / symbol queries
```

## Grammar

Pinned to [`waddie/tree-sitter-applescript`](https://github.com/waddie/tree-sitter-applescript)
at a specific commit in `extension.toml`. Bump the `rev` field and reinstall
the dev extension to upgrade.

## License

MIT
