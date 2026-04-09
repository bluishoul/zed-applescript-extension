-- finder-automation.applescript
-- Showcases `tell application` blocks, the `'s` property-access syntax,
-- POSIX path conversion, and Finder tags — the kind of thing AppleScript
-- is actually used for on a daily basis.

property desktopFolder : path to desktop folder

on run
    tagRecentScreenshots()
end run

-- Tag every screenshot taken in the last day with the "Review" tag.
on tagRecentScreenshots()
    set cutoff to (current date) - 1 * days

    tell application "Finder"
        set desk to desktopFolder as alias
        set recentShots to every file of desk whose ¬
            name starts with "Screen Shot" and creation date is greater than cutoff

        repeat with shot in recentShots
            set shot's label index to 6 -- green
            my addTag(shot as alias, "Review")
        end repeat

        return count of recentShots
    end tell
end tagRecentScreenshots

-- Append a Finder tag to a file without clobbering existing tags.
on addTag(theFile, newTag)
    tell application "Finder"
        set existingTags to the tags of theFile
        if existingTags does not contain newTag then
            set the tags of theFile to existingTags & {newTag}
        end if
    end tell
end addTag

-- Handy utility: turn a Finder alias into a POSIX path and back.
on posixPathOf(theAlias)
    return POSIX path of theAlias
end posixPathOf
