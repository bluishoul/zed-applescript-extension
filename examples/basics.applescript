-- basics.applescript
-- Primitive values, control flow, and handler forms.
--
-- Opening this file in Zed should highlight:
--   * `--` line comments and this `(* ... *)` block comment below
--   * keywords (set, if, repeat, on, to, return, ...)
--   * strings, numbers, booleans, missing value
--   * handler names as functions
--   * word-based comparison operators

(*
  AppleScript supports block comments with (* *) as well.
  They can span multiple lines and nest inside other syntax.
*)

-- Numbers, strings, booleans, and the "missing value" constant
set theAnswer to 42
set pi to 3.14159
set greeting to "Hello, " & "world!"
set isReady to true
set nothingYet to missing value

-- Lists and records
set primes to {2, 3, 5, 7, 11, 13}
set person to {name:"Ada", role:"engineer", joined:2024}

-- Word-based comparison operators
if theAnswer is greater than or equal to 40 then
    log "big enough"
else if theAnswer is less than 10 then
    log "too small"
else
    log "somewhere in between"
end if

if greeting contains "world" and greeting doesn't contain "goodbye" then
    log "friendly"
end if

-- Repeat forms
repeat 3 times
    log "tick"
end repeat

repeat with i from 1 to 5
    log "i = " & i
end repeat

repeat with p in primes
    if p is greater than 5 then exit repeat
    log p
end repeat

set countdown to 3
repeat while countdown is greater than 0
    log countdown
    set countdown to countdown - 1
end repeat

-- Try / on error
try
    set x to 1 / 0
on error errMsg number errNum
    log "caught error " & errNum & ": " & errMsg
end try

-- Simple handler (parenthesised parameters)
on greet(who)
    return "Hello, " & who & "!"
end greet

-- Positional handler (no parentheses, labeled parameters)
on welcome someone given role:aRole
    return "Welcome, " & someone & ", our new " & aRole & "."
end welcome

-- Labeled handler using `to`
to summarise theList
    set total to 0
    repeat with item in theList
        set total to total + item
    end repeat
    return total
end summarise

-- Call them
log greet("Ada")
log welcome "Grace" given role:"captain"
log summarise(primes)
