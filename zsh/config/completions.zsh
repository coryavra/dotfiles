# Shell completion settings

# Enable case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'

# Enable menu selection for completion (arrow keys to select options)
zstyle ':completion:*' menu select

# List all options at the bottom when tab is pressed (like Oh-My-Zsh)
zstyle ':completion:*' list-prompt '%S%M matches%s'

# Automatically list choices when there are multiple completions
zstyle ':completion:*' auto-list 1

# Display matches in a list even for a single match
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Ensure tab completion cycles through options with highlight
autoload -Uz compinit # load compinit, zsh's autocomplete program
compinit # initialize compinit

# Map Shift-Tab to reverse menu selection
bindkey '^[[Z' reverse-menu-complete # Shift-Tab 
