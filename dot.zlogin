test -t 0 || return

. $HOME/.zinit
for i in $ZDOTDIR_LOCAL/*_zlogin_* ; do
    if [ -f $i ] ; then
        START=$SECONDS
        . $i
        prtiming $(basename $i)	$START
    fi
done
