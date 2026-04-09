# Examples

Small, self-contained AppleScript files used as highlighting fixtures for the
Zed extension. Each file targets a different slice of the language so that any
regression in `highlights.scm`, `indents.scm`, or the pinned tree-sitter
grammar shows up visually when you open the file in Zed.

These are also a reasonable place to start reading if you want to see the
shape of typical AppleScript.

| File | What it exercises |
| --- | --- |
| [`basics.applescript`](./basics.applescript) | Variables, numbers, strings, lists, records, `if` / `repeat` / `try`, all three handler forms, word-based comparison operators. |
| [`finder-automation.applescript`](./finder-automation.applescript) | `tell application "Finder"`, selection handling, `'s` property access, POSIX paths, Finder tags. |
| [`script-object.applescript`](./script-object.applescript) | A `script` block used as a class-like object with properties and methods. |
| [`shell-and-js.applescript`](./shell-and-js.applescript) | `do shell script` and `do JavaScript` literals — also a preview for the future `injections.scm` work. |
| [`osascript-shebang`](./osascript-shebang) | Extension-less file starting with `#!/usr/bin/env osascript` — verifies `first_line_pattern` detection. |

None of these scripts do anything harmful if you actually run them, but a few
will touch Finder and the filesystem in harmless ways (listing desktop items,
reading clipboard, etc.). Read before running.
