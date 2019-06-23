test -t 0 || return

export ZDOTDIR=${ZDOTDIR:-$HOME}
typeset -F SECONDS

. $HOME/.zinit
for i in $ZDOTDIR_LOCAL/*_zshenv_* ; do
    if [ -f $i ] ; then
        START=$SECONDS
        . $i
        prtiming $(basename $i)	$START
    fi
done
