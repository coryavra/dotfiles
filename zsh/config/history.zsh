# Shell history settings

# How many commands to keep in memory (1,000)
HISTSIZE=1000

# How many commands to save to the history file (1,000,000)
SAVEHIST=1000000

# Append to the history file, rather than overwriting it
setopt append_history

# Write history incrementally (after every command)
setopt inc_append_history

# Share command history data across sessions
setopt share_history

# Ignore duplicated commands history list
setopt hist_ignore_dups

# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_expire_dups_first

# Enable substring history search with the up/down arrows
bindkey '^[[A' history-search-backward   # Up arrow
bindkey '^[[B' history-search-forward    # Down arrow
