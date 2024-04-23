# If this option is unset, the startup files /etc/zprofile, /etc/zshrc,
# /etc/zlogin and /etc/zlogout will not be run.
unsetopt GLOBAL_RCS

# Keep only the first occurrence of each duplicated value. For variables with
# shared values it is recommended to set the flag for all interfaces.
typeset -U PATH path

# An array (colon-separated list) of directories to search for commands
path=(~/bin /{opt,usr}/local/{bin,sbin} $path)

# Remove nonexistent directories.
# * '${^path}' turns on the RC_EXPAND_PARAM option for the evaluation of path.
#   When this option is set, array expansions of the form foo${xx}bar, where
#   the parameter xx is set to (a b c), are substituted with
#   'fooabar foobbar foocbar' instead of the default 'fooa b cbar'.
# * Patterns used for filename generation may end in a list of qualifiers
#   enclosed in parentheses. The qualifiers specify which filenames that
#   otherwise match the given pattern will be inserted in the argument list.
#   * '-' toggles between making the qualifiers work on symbolic links
#     (the default) and the files they point to.
#   * '/' matches directories.
#   * 'N' sets the NULL_GLOB option for the current pattern.
path=(${^path}(-/N))
