; Handlers (functions)
(simple_handler
  "on" @context
  name: (identifier) @name) @item

(positional_handler
  "on" @context
  name: (identifier) @name) @item

(labeled_handler
  "to" @context
  name: (identifier) @name) @item

; Script objects (classes)
(script_statement
  "script" @context
  name: (identifier) @name) @item

; Top-level property declarations
(property_statement
  "property" @context
  name: (identifier) @name) @item
