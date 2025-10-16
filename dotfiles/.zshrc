# Path
export PATH="$HOME/bin:$PATH"

# Prompt
fastfetch
autoload -Uz promptinit
promptinit
prompt adam1

# Aliases
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"
alias gs="git status"
alias gp="git pull"
alias gd="git diff"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Enable completion
autoload -Uz compinit
compinit

# Enable syntax highlighting if installed
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Enable autosuggestions if installed
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Editor
export EDITOR=nano

# Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
