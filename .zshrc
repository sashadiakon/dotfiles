# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Only run interactive shell config in interactive shells
[[ -o interactive ]] || return

# --- editor ---
export EDITOR="${EDITOR:-nano}"
export SUDO_EDITOR="$EDITOR"

# --- history ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=32768
SAVEHIST=32768

setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt extended_history

# --- readline / key bindings ---
bindkey -e

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

bindkey '^[[C' forward-char
bindkey '^[[D' backward-char

# --- completion ---
autoload -Uz compinit
compinit

zmodload zsh/complist

setopt auto_list
unsetopt menu_complete
setopt complete_in_word
setopt auto_param_slash
setopt list_types

LISTMAX=200

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- prompt ---
PS1='%n@%m:%~%# '

# --- directories ---
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# --- file system ---
case "$OSTYPE" in
  darwin*)
    alias ls='ls -G'
    alias o='open .'
    ;;
  linux*)
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias o='xdg-open .'
    ;;
esac

alias ll='ls -lh'
alias la='ls -lah'
alias l='ls -CF'

# --- safety aliases ---
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- helpers ---
alias reload='source ~/.zshrc'

path() {
  print -l $path
}

# --- simple functions ---
mkcd() {
  mkdir -p "$1" && cd "$1"
}

extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.gz)      gunzip "$1" ;;
      *)         print "Cannot extract: $1" ;;
    esac
  else
    print "Not a file: $1"
  fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/cachyos-zsh-config/cachyos-config.zsh
