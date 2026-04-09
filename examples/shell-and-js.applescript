-- shell-and-js.applescript
-- `do shell script` and `do JavaScript` are AppleScript's escape hatches
-- into the Unix layer and (via Safari) the web. This file also serves as
-- a preview of the planned `injections.scm` work: once injections land,
-- the bodies of these string literals should light up as bash and
-- javascript respectively.

-- Run a shell command and capture stdout.
on currentGitBranch(projectPath)
    try
        set cmd to "cd " & quoted form of projectPath & " && git rev-parse --abbrev-ref HEAD"
        return do shell script cmd
    on error
        return missing value
    end try
end currentGitBranch

-- Elevate with the system sudo prompt. Harmless here — just reads uptime.
on readUptime()
    return do shell script "uptime" with administrator privileges
end readUptime

-- Inject a multi-line bash snippet. A future injections.scm will
-- highlight the body as bash.
on diskUsage()
    return do shell script "
        set -euo pipefail
        df -h / | awk 'NR==2 { print $5 }'
    "
end diskUsage

-- Run JavaScript inside the frontmost Safari tab.
on pageTitle()
    tell application "Safari"
        if (count of documents) is 0 then return missing value
        return do JavaScript "document.title" in document 1
    end tell
end pageTitle

-- Inject a multi-line JavaScript snippet. A future injections.scm will
-- highlight the body as javascript.
on highlightHeadings()
    tell application "Safari"
        do JavaScript "
            const hs = document.querySelectorAll('h1, h2, h3');
            hs.forEach((h, i) => {
                h.style.outline = '2px solid hotpink';
                h.dataset.idx = String(i);
            });
            hs.length;
        " in document 1
    end tell
end highlightHeadings
