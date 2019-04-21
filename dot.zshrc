export ZDOTDIR_LOCAL=${ZDOTDIR_LOCAL:-$HOME/.rc/zshell}

for i in $ZDOTDIR_LOCAL/*_zshrc_* ; do
    if [ -f $i ] ; then
        . $i
    fi
done
