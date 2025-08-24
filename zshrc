# Emit color codes only when standard output is connected to a terminal.
alias ls='ls --color=auto'

# Keep only the first occurrence of each duplicated value. For variables with
# shared values it is recommended to set the flag for all interfaces.
typeset -U FPATH fpath

# An array (colon separated list) of directories specifying the search path
# for function definitions
fpath=(~/.zfunctions ~/.zfunctions/pure $fpath)

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

# The file to save the history in when an interactive shell exits
HISTFILE=~/.zsh_history

# The maximum number of events stored in the internal history list
#
# If you use the HIST_EXPIRE_DUPS_FIRST option, setting this value larger than
# the SAVEHIST size will give you the difference as a cushion for saving
# duplicated history events.
HISTSIZE=125000

# The maximum number of history events to save in the history file
SAVEHIST=100000

# Save each command's beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file.
setopt EXTENDED_HISTORY

# If the internal history needs to be trimmed to add the current command line,
# setting this option will cause the oldest history event that has a duplicate
# to be lost before losing a unique event from the list.
setopt HIST_EXPIRE_DUPS_FIRST

# Do not enter command lines into the history list if they are duplicates of
# the previous event.
setopt HIST_IGNORE_DUPS

# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading
# space.
setopt HIST_IGNORE_SPACE

# Remove superfluous blanks from each command line being added to the history
# list.
setopt HIST_REDUCE_BLANKS

# Whenever the user enters a line with history expansion, don't execute the
# line directly; instead, perform history expansion and reload the line into
# the editing buffer.
setopt HIST_VERIFY

# This option both imports new commands from the history file, and also causes
# your typed commands to be appended to the history file (the latter is like
# specifying INC_APPEND_HISTORY, which should be turned off if this option is
# in effect).
setopt SHARE_HISTORY

# Initialize prompt themes.
autoload -Uz promptinit && promptinit

# The max execution time of a process before its run time is shown when it
# exits
PURE_CMD_MAX_EXEC_TIME=1

# Set the prompt theme.
prompt pure
