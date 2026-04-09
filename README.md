# AppleScript for Zed

AppleScript language support for the [Zed](https://zed.dev) editor. Open any
`.applescript`, `.scpt`, or `.scptd` file and you get syntax highlighting,
smart indentation, bracket matching, and outline navigation out of the box.

Parsing is powered by the
[`waddie/tree-sitter-applescript`](https://github.com/waddie/tree-sitter-applescript)
grammar.

## What you get today

- **Syntax highlighting** — keywords, strings, numbers, comments, handler
  definitions, properties, operators, and AppleScript's word-based comparison
  phrases (`is greater than or equal to`, `doesn't contain`, and friends).
- **Outline view** — press `cmd-shift-O` to jump between handlers, script
  objects, and top-level property declarations.
- **Smart indentation** — automatically indents the body of `tell`, `if`,
  `repeat`, `try`, `considering`, `ignoring`, `with timeout`,
  `with transaction`, handler (`on …`), and `script` blocks, and dedents on
  `end` / `else`.
- **Bracket & quote auto-close** — typing `(`, `{`, or `"` inserts the closing
  counterpart; pairs are highlighted when your cursor is next to them.
- **Line & block comments** — `cmd-/` toggles `--` comments; `(* … *)` block
  comments are also recognised.
- **Shebang detection** — files that start with `#!/usr/bin/osascript` or
  `#!/usr/bin/env osascript` are recognised as AppleScript even without a
  `.applescript` / `.scpt` extension.

For the complete feature landscape — what's shipped, what's planned, what's
being considered, and what's deliberately out of scope — see **[FEATURES.md](./FEATURES.md)**.

A small corpus of example scripts lives in [`examples/`](./examples/) — open
any of them in Zed after installing to see the highlighter at work on real
AppleScript.

## Install

The extension isn't in the Zed extension registry yet, so install it as a dev
extension:

1. Clone this repository somewhere on your machine.
2. Open Zed and run **`zed: install dev extension`** from the command palette
   (`cmd-shift-P`).
3. Pick the cloned folder.

Zed will fetch the tree-sitter grammar, compile it to WebAssembly, and
register the language. The first build takes a few seconds; afterwards,
opening an AppleScript file Just Works.

To update the extension after pulling new commits, run
`zed: install dev extension` again on the same folder.

## Supported file types

| Suffix          | Detected as |
| --------------- | ----------- |
| `.applescript`  | AppleScript |
| `.scpt`         | AppleScript |
| `.scptd`        | AppleScript |

Suffix-less scripts whose first line is an `osascript` shebang — e.g.
`#!/usr/bin/osascript` or `#!/usr/bin/env osascript` — are also detected as
AppleScript.

> **Note on JXA.** `osascript` can run JavaScript for Automation (JXA) when
> invoked with `-l JavaScript`. Because the shebang rule matches any line
> containing `osascript`, a JXA script with such a shebang will currently be
> recognised as AppleScript too. If you hit this, set the language explicitly
> from the status bar or give the file a `.js` extension.

## Reporting issues

If highlighting looks wrong, indentation gets confused, or a valid AppleScript
construct isn't recognised, please open an issue with a minimal code sample.
Include the Zed version (`zed --version`) and — if Zed logs an error — the
relevant line from `~/Library/Logs/Zed/Zed.log`.

## [License](./LICENSE)

MIT
