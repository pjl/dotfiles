# Emit color codes only when standard output is connected to a terminal.
alias ls='ls --color=auto'

# Keep only the first occurrence of each duplicated value. For variables with
# shared values it is recommended to set the flag for all interfaces.
typeset -U FPATH fpath

# An array (colon separated list) of directories specifying the search path
# for function definitions
fpath=(~/.zfunctions/pure $fpath)

# Remove nonexistent directories.
fpath=(${^fpath}(-/N))

# Initialize completion.
# * The usual alias expansion during reading will be suppressed if the
#   autoload builtin or its equivalent is given the option -U. This is
#   recommended for the use of functions supplied with the zsh distribution.
# * The flag -z marks the function to be autoloaded using the zsh style.
autoload -Uz compinit && compinit

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
