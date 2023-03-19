# the syntax for this file: 
# set --local namewhatischange color # name of the color in the rose-pine palette

# if you have any suggestions, make a PR. 😃

# Color Palette
set --local foreground 286983 # pine 
set --local selection 575279 # text 
set --local selectionvi cecacd # highlight high
set --local autosuggestions 9893a5 # muted 
set --local comment 907aa9 # iris
set --local separators d7827e # rose 
set --local errors b4637a # love 
set --local rootcolor b4637a # love 
set --local command 286983 # pine 
set --local cwduser 286983 # pine 
set --local escape ea9d34 # gold
set --local remote ea9d34 # gold
set --local quote ea9d34 # gold
set --local description ea9d34 # gold 
set --local param 575279 # text 
set --local redirection d7827e # rose
set --local progress fffaf3 # surface
set --local selectiontext 575279 # text
set --local prefix 56949f # foam
set --local secondary faf4ed # base
set --local userprompt 907aa9 # iris 
set --local host cecacd # highlight high 
set --local keyword ea9d34 # gold 
set --local operator ea9d34 # gold


# syntax highlighting variables
set --global fish_color_autosuggestion $autosuggestions # the color used for autosuggestions. (the proposed rest of a command)
set --global fish_color_cancel --reverse # the color for the '^c' indicator on a canceled command.
set --global fish_color_command --bold $command # the color for commands.
set --global fish_color_comment $comment # the color used for code comments. (like '# important')
set --global fish_color_keyword $keyword # the color used for keywords like if - this falls back on command color if unset.
set --global fish_color_cwd $cwduser # the color used for the current working directory in the default prompt.
set --global fish_color_cwd_root $red # the color used for the current working directory when we're root.
set --global fish_color_end $separators # The color for process separators. (like ';' and '&')
set --global fish_color_error $errors --bold # The color used to highlight potential errors.
set --global fish_color_escape $escape # The color used to highlight character escapes. (like '\n' and '\x70')
set --global fish_color_history_current --bold # The color used to print the current directory history (dirh).
set --global fish_color_host $host # The color used to print the hostname in the default prompt.
set --global fish_color_host_remote $remote # The color used to print the hostname in the default prompt for remote sessions. (like ssh)
set --global fish_color_match --background=$keyword # The color used to highlight matching parenthesis.
set --global fish_color_normal $foreground # The default color.
set --global fish_color_operator $operator # The color for parameter expansion operators. (like '*' and '~')
set --global fish_color_param $param # The color for ordinary command parameters.
set --global fish_color_quote $quote # The color for quoted text. (like "abc")
set --global fish_color_redirection $redirection # The color for IO redirections. (like >/dev/null)
set --global fish_color_selection $selectionvi --bold --background=$selectionvi # The color used when selecting text (in vi visual mode).
set --global fish_color_status $errors # The color used when stopped at a breakpoint.
set --global fish_color_user $userprompt # The color used for the username in the default prompt.
set --global fish_color_valid_path --underline # The color used for valid path.
set --global fish_pager_color_completion $selectiontext # The color of the completion itself, i.e. the proposed rest of the string.
set --global fish_pager_color_selected_background --background=$selectiontext
set --global fish_pager_color_selected_completion $secondary
set --global fish_pager_color_description $description --dim # The color of the completion description.
set --global fish_pager_color_prefix $prefix --bold # The color of the prefix string, i.e. the string that is to be completed.
set --global fish_pager_color_progress --background=$progress # The color of the progress bar at the bottom left corner.
set --global fish_pager_color_secondary $secondary # The background color of the every second completion.
