; Comments
(comment) @comment

; Keywords
[
  "tell"
  "end"
  "if"
  "then"
  "else"
  "repeat"
  "times"
  "while"
  "until"
  "from"
  "to"
  "by"
  "in"
  "try"
  "on"
  "error"
  "set"
  "copy"
  "return"
  "exit"
  "considering"
  "ignoring"
  "with"
  "without"
  "timeout"
  "transaction"
  "of"
  "seconds"
  "use"
  "scripting"
  "additions"
  "application"
  "version"
  "script"
  "property"
  "and"
  "or"
  "not"
  "as"
] @keyword

; Boolean and built-in constants
(boolean) @boolean
(missing_value) @constant
(current_application) @constant

; Numbers
(integer) @number
(real) @number

; Strings
(string) @string

; Identifiers (base rule — overridden by more specific ones below)
(identifier) @variable

; Handler (function) definitions
(simple_handler
  name: (identifier) @function)

(positional_handler
  name: (identifier) @function)

(labeled_handler
  name: (identifier) @function)

(simple_handler
  end_name: (identifier) @function)

(positional_handler
  end_name: (identifier) @function)

(labeled_handler
  end_name: (identifier) @function)

; Script objects (class-like)
(script_statement
  name: (identifier) @type)

; Handler parameters
(parameter_list
  (identifier) @variable)

(direct_parameter
  parameter: (identifier) @variable)

(labeled_parameter
  parameter: (identifier) @variable)

; Property statements
(property_statement
  name: (identifier) @property)

; Record keys
(record_entry
  key: (_) @property)

; Application expressions
(application_expression
  name: (string) @string.special)

(application_expression
  name: (identifier) @variable)

; Script references
(script_reference
  (string) @string.special)

; Type casts
(type_cast
  type: (identifier) @type)

; Objective-C method calls
(method_call
  method: (method_call_label) @function.method)

; Built-in multi-word commands
[
  (system_attribute)
  (do_shell_script)
  (do_javascript)
  (write_text)
  (create_window)
  (create_tab)
  (path_to_command)
] @function.special

; Multi-word built-in references (Terminal, System Events, etc.)
[
  (current_session)
  (current_window)
  (current_tab)
  (first_window)
  (first_process)
  (first_button)
  (first_document)
  (first_item)
  (front_document)
  (front_window)
  (selected_tab)
  (selected_window)
  (every_item)
  (every_window)
  (scroll_area)
  (radio_group)
  (radio_button)
] @variable.special

; Operators
[
  "="
  "≠"
  ">"
  "<"
  "≥"
  "≤"
  ">="
  "<="
  "+"
  "-"
  "*"
  "/"
  "÷"
  "^"
  "&"
  "div"
  "mod"
] @operator

; Word-based comparison operators
[
  "equals"
  "is equal to"
  "is equal"
  "equal to"
  "is not"
  "is not equal to"
  "is not equal"
  "isn't"
  "isn't equal to"
  "is greater than"
  "greater than"
  "comes after"
  "is less than"
  "less than"
  "comes before"
  "is greater than or equal to"
  "is greater than or equal"
  "is less than or equal to"
  "is less than or equal"
  "is"
  "contains"
  "contain"
  "does not contain"
  "doesn't contain"
  "is in"
  "is contained by"
  "is not in"
  "is not contained by"
  "starts with"
  "start with"
  "begins with"
  "begin with"
  "ends with"
  "end with"
] @operator

; Punctuation
[
  "("
  ")"
  "{"
  "}"
] @punctuation.bracket

[
  ","
  ":"
] @punctuation.delimiter

"'s" @punctuation.special

; Calls (placed last so they override the generic identifier rule)
(application_command
  command: (identifier) @function)

(handler_call
  name: (identifier) @function)

; Tell-block targets
(tell_statement
  target: (expression
    (identifier) @variable.special))
