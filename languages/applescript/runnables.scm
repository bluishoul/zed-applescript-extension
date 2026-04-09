; Attach a ▶ button to every top-level definition.
;
; AppleScript has no isolated-handler execution model — running a single
; handler would require synthesising a call into it, which is non-trivial
; in the general case. So every ▶ button here runs the *whole file* via
; `osascript`. The button is anchored on the handler / script name purely
; to give you a convenient click target anywhere in a non-trivial script.
;
; Linked to the "osascript: run current file" task via the `applescript-run`
; tag defined in tasks.json.

((simple_handler
  name: (identifier) @run) @_def
  (#set! tag applescript-run))

((positional_handler
  name: (identifier) @run) @_def
  (#set! tag applescript-run))

((labeled_handler
  name: (identifier) @run) @_def
  (#set! tag applescript-run))

((script_statement
  name: (identifier) @run) @_def
  (#set! tag applescript-run))
