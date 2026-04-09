-- script-object.applescript
-- `script` blocks are AppleScript's answer to classes: a named container
-- of properties and handlers that can be passed around as a value.

script Counter
    property currentValue : 0
    property step : 1

    on increment()
        set currentValue to currentValue + step
        return currentValue
    end increment

    on reset()
        set currentValue to 0
    end reset

    on describe()
        return "Counter at " & currentValue & " (step " & step & ")"
    end describe
end script

-- Use the script object like a struct + methods
tell Counter
    reset()
    increment()
    increment()
    increment()
    log describe() -- "Counter at 3 (step 1)"
end tell

-- Change a property from the outside
set step of Counter to 10
tell Counter to increment()
log Counter's describe()

-- Script objects can be constructed by handlers, too
on makeGreeter(salutation)
    script
        property greeting : salutation

        on sayHi(name)
            return greeting & ", " & name & "!"
        end sayHi
    end script
end makeGreeter

set formal to makeGreeter("Good evening")
set casual to makeGreeter("Hey")

log formal's sayHi("Ada")   -- "Good evening, Ada!"
log casual's sayHi("Grace") -- "Hey, Grace!"
