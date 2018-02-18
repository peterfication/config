-- https://www.alfredapp.com/blog/tips-and-tricks/better-iterm-integration-in-alfred/
-- From https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred/blob/master/custom_iterm_script_iterm_2.9.applescript
on alfred_script(q)
  run script "
    on run {q}
      tell application \":Applications:iTerm.app\"
        activate

        create window with default profile
        select first window

        tell the first window
        tell current session to write text q
        end tell
      end tell
    end run
  " with parameters {q}
end alfred_script
