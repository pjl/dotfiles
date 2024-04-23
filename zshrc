# Emit color codes only when standard output is connected to a terminal.
alias ls='ls --color=auto'

typeset -U fpath
fpath=(~/.zfunctions/pure $fpath)
fpath=($^fpath(-/N))

autoload -U compinit && compinit

# Set up fzf key bindings and fuzzy completion.
if [[ -d /opt/local/share/fzf/shell ]]; then
  source /opt/local/share/fzf/shell/completion.zsh
  source /opt/local/share/fzf/shell/key-bindings.zsh
elif [[ -d /usr/share/doc/fzf/examples ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U promptinit && promptinit
prompt pure
