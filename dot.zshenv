#
export ZDOTDIR=${ZDOTDIR:-~}
export ZDOTDIR_LOCAL=${ZDOTDIR_LOCAL:-$HOME/.rc/zshell}
typeset -F SECONDS

if [ ! -t 0 ] ; then
    return
fi

for i in $ZDOTDIR_LOCAL/*_zshenv_* ; do
    if [ -f $i ] ; then
        START=$SECONDS
        . $i
        prtiming $(basename $i)	$START
    fi
done
