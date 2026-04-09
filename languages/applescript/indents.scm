; Block-like constructs that end with the "end" keyword.
; The enclosing node is captured with @indent; the "end" token is
; captured with @end so Zed dedents before it.

(simple_handler "end" @end) @indent
(positional_handler "end" @end) @indent
(labeled_handler "end" @end) @indent

(script_statement "end" @end) @indent
(tell_statement "end" @end) @indent

(if_statement "end" @end) @indent

(repeat_forever "end" @end) @indent
(repeat_times "end" @end) @indent
(repeat_while "end" @end) @indent
(repeat_until "end" @end) @indent
(repeat_with "end" @end) @indent
(repeat_with_in "end" @end) @indent

(try_statement "end" @end) @indent

(considering_statement "end" @end) @indent
(ignoring_statement "end" @end) @indent
(timeout_statement "end" @end) @indent
(transaction_statement "end" @end) @indent

; Parenthesised expressions indent like regular brackets.
(parenthesized_expression "(" ")" @end) @indent

; List and record literals.
(list "{" "}" @end) @indent
(record "{" "}" @end) @indent
