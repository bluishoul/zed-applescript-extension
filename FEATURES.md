# Features & Roadmap

This document tracks the full scope of what an AppleScript language extension
for [Zed](https://zed.dev) *could* offer, what this extension ships today, and
what the maintainers intend to pursue next.

> **Commitment levels.** The roadmap below is a statement of intent, not a
> promise. Items are grouped so you can tell at a glance whether a feature is
> shipping, actively planned, merely under consideration, or explicitly out of
> scope. Things move between groups as priorities change.
>
> - ✅ **Shipped** — available in the current release.
> - 🛠 **Planned** — we intend to build this, likely soon. Contributions welcome.
> - 🤔 **Under consideration** — useful in principle, but not yet committed to.
>   May ship, may not. PRs can push it over the line.
> - 🚫 **Out of scope** — intentionally not planned here. Either impractical, or
>   belongs in a separate project / extension type.

---

## ✅ Shipped

Everything in this section works in the installed extension today.

### Syntax & editing

| Feature | Notes |
| --- | --- |
| File type detection | Recognises `.applescript`, `.scpt`, `.scptd`. |
| Syntax highlighting | Keywords, strings, numbers, comments, handlers, properties, operators, and AppleScript's word-based comparison phrases (e.g. `is greater than or equal to`). |
| Line & block comments | `--` / `#` line comments, `(* … *)` block comments. Toggle with `cmd-/`. |
| Bracket matching | Highlights the matching `(`, `)`, `{`, `}` pair. |
| Auto-close | Typing an opening bracket or quote inserts the closing one. Suppressed inside strings and comments where appropriate. |
| Auto-indent | Indents inside `tell`, `if`, `repeat` (all variants), `try`, `considering`, `ignoring`, `with timeout`, `with transaction`, `on` (handler), and `script` blocks. Dedents on `end` / `else`. |
| Outline navigation | `cmd-shift-O` lists every handler, script object, and top-level `property` declaration. |
| Rainbow brackets | Compatible with Zed's rainbow bracket rendering. |

---

## 🛠 Planned

Next on the list. These are all small, self-contained query files and should
land soon.

| Feature | What you'll get | Notes |
| --- | --- | --- |
| Language injections | Bash highlighting inside `do shell script "…"`, JavaScript highlighting inside `do JavaScript "…"`. | `injections.scm` |
| Shebang detection | Files starting with `#!/usr/bin/osascript` (no extension) are recognised as AppleScript. | `config.toml` `first_line_pattern` |
| Smarter string/comment behaviour | Auto-close and completion are suppressed inside strings and comments. | `overrides.scm` |
| Text objects (vim mode) | `vaf` / `daf` select an entire handler; similar for script objects and repeat blocks. | `textobjects.scm` |
| Example scripts | A small corpus of real AppleScript snippets used for highlight regression testing. | `examples/` |
| Continuous integration | Pull request workflow that parses the example corpus with the pinned grammar, catching breakage from grammar bumps. | GitHub Actions |
| Registry release | Publish the extension to the Zed extension registry so it installs with one click from the Extensions panel. | PR to `zed-industries/extensions` |

---

## 🤔 Under consideration

Features we'd like to have but aren't committed to. Feedback and PRs can
promote anything here into **Planned**.

| Feature | What it would give you | Caveats |
| --- | --- | --- |
| One-click run (`cmd-shift-T` task) | A Zed task that runs the current file with `osascript`. | Easy to add; we need to confirm the default Zed task UX for AppleScript is worth building in before shipping it. |
| Inline ▶ runnables per handler | A run button next to each handler definition. | Requires deciding how a single handler should be invoked — wrapping with a synthetic `run` block is non-trivial. |
| Diagnostics via `osacompile` | Red squiggles for syntax errors, powered by shelling out to `osacompile -o /dev/null` and parsing its stderr. | Requires shipping a Rust + WASM extension crate. Doable, but a significant step up in complexity from the current pure-query extension. |
| File / tab icon | A dedicated AppleScript icon in the file tree and tab bar. | In Zed, file icons belong to *icon theme* extensions, not language extensions. Would need a separate icon-theme contribution. |
| Snippets (`tell application`, `repeat with`, handler scaffolds, …) | Quick expansion of common AppleScript boilerplate. | Zed treats snippets as a separate extension type. Would likely be a sibling extension rather than part of this one. |

---

## 🚫 Out of scope

Not planned in this repository. Each entry lists why, and where the work would
belong if someone wanted to tackle it.

| Feature | Why not here |
| --- | --- |
| Full language server (completion, hover, go-to-definition, rename, signature help, workspace symbols, code actions, inlay hints, semantic tokens, formatting) | No mainstream AppleScript LSP exists. Building one is a substantial standalone project (`applescript-language-server`) and should live in its own repository; this extension would then consume it. |
| Debug adapter (DAP) integration | There is no public AppleScript debug adapter protocol implementation, and the language offers no debugger surface to wire up. |
| REPL / inline execution | AppleScript has no REPL model Zed could meaningfully embed. |
| Slash commands, MCP context servers, or other chat/AI-agent integrations | Not language-specific; would belong in a general-purpose extension. |

---

## Glossary

A few of the terms above refer to specific files Zed loads from the
`languages/applescript/` directory:

- **`config.toml`** — basic language configuration: file suffixes, comment
  syntax, bracket pairs, indent settings.
- **`highlights.scm`** — tree-sitter query describing how source nodes map to
  highlight colours.
- **`brackets.scm`** — tree-sitter query identifying bracket pairs for matching
  and rainbow colouring.
- **`indents.scm`** — tree-sitter query describing which nodes start an indented
  block and where the block ends.
- **`outline.scm`** — tree-sitter query listing the symbols shown in the
  outline view (`cmd-shift-O`).
- **`injections.scm`**, **`overrides.scm`**, **`textobjects.scm`** —
  additional tree-sitter query files for embedded-language highlighting,
  context overrides, and vim-style selection units, respectively.

---

Have a feature you want moved up the list? Open an issue or a PR.
