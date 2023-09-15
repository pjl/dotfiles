unsetopt GLOBAL_RCS

typeset -U path
path=(${HOME}/bin /{opt,usr}/local/{bin,sbin} $path)
path=($^path(-/N))
