# Only run interactive shell config in interactive shells
case $- in
  *i*) ;;
  *) return ;;
esac

# --- editor ---
export EDITOR="${EDITOR:-nano}"
export SUDO_EDITOR="$EDITOR"

# --- history ---
shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=32768
HISTFILESIZE=32768
HISTFILE="$HOME/.bash_history"

# Save and reload history across terminal tabs
PROMPT_COMMAND='history -a; history -n'

# --- readline / key bindings ---
# Up/Down search history by what you already typed
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

# Better completion behavior
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set mark-symlinked-directories on'

# --- prompt ---
PS1='\u@\h:\w\$ '

# --- directories ---
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# --- file system ---
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# --- safety aliases ---
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- macOS helpers ---
alias o='open .'
alias reload='source ~/.bashrc'
alias path='echo "$PATH" | tr ":" "\n"'

# --- simple functions ---
mkcd() {
  mkdir -p "$1" && cd "$1"
}

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.gz)      gunzip "$1" ;;
      *)         echo "Cannot extract: $1" ;;
    esac
  else
    echo "Not a file: $1"
  fi
}

# Make Tab show completion options instead of cycling candidates
bind '"\t": complete'

# Show ambiguous matches immediately
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'

# Optional: make completion case-insensitive
bind 'set completion-ignore-case on'

# External inputrc — disabled
[[ $- == *i* ]] && bind -f ~/dotfiles/inputrc
