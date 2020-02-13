# derived from Robby Russell's and minimal theme
#
ZSH_THEME_GIT_PROMPT_PREFIX='%F{blue}%B[%b%F{red}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%F{blue}%B]%b%f'
ZSH_THEME_GIT_PROMPT_DIRTY='%F{yellow}✗%f'
ZSH_THEME_GIT_PROMPT_CLEAN=""
# ✗
# ●
# »

ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
ZSH_THEME_HG_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN

vcs_status() {
    if [[ $(whence in_svn) != "" ]] && in_svn; then
        svn_prompt_info
    elif [[ $(whence in_hg) != "" ]] && in_hg; then
        hg_prompt_info
    else
        git_prompt_info
    fi
}

if [ "x$SSH_CLIENT" != 'x' ] ; then
    _Host='(%m) '
else
    _Host=''
fi
_CWkDir='%F{cyan}%1~%f '
_Status='%B%(?+%F{blue}+%F{red})➜%f%b '
_Prompt="${_Host}${_CWkDir}"'$(vcs_status)'"${_Status}"
PROMPT='%(!.%K{194}'"$_Prompt"'%k.'"$_Prompt"')'
RPROMPT='%*'
