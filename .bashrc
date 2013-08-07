# ------~------~
# Anthony Clark
# ------~------~
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shopt
shopt -s histappend
shopt -s checkwinsize

# To color or not to color
color_prompt=

if which tput > /dev/null && tput setaf 1 &>/dev/null; then 
    color_prompt=yes
fi

if [ "$color_prompt" = yes ] ; then

    case $(( UID)) in
        0)  # root
            PS1='[\[$(tput setaf 1)\]\h\[$(tput sgr0)\]]\[$(__make_flags)\][\[$(tput bold)\]\[$(tput setaf 1)\]\w\[$(tput sgr0)]\]# '
            ;;
        *)
            PS1='[\[$(tput setaf 6)\]\h\[$(tput sgr0)\]]\[$(__make_flags)\][\[$(tput bold)\]\[$(tput setaf 2)\]\w\[$(tput sgr0)]\]$(__git_ps1 "(%s)")\$ '
            ;;
    esac

    # color specific aliases
    alias ls="ls --color=auto" # THIS BREAKS in OSX

else
    PS1='[\u@\h \W]\$ '
fi


#The 'ls' family (in all it's glory)
####################################
alias ll="ls -l --group-directories-first"
alias la="ls -a"            # show hidden files
alias lx="ls -lXB"          # sort by extension
alias lk="ls -lSr"          # sort by size, biggest last
alias lc="ls -ltcr"         # sort by and show change time, most recent last
alias lu="ls -ltur"         # sort by and show access time, most recent last
alias lt="ls -ltr"          # sort by date, most recent last
alias lm="ls -al |more"     # pipe through 'more'
alias lr="ls -lR"           # recursive ls
alias lsr="tree -Csu"       # nice alternative to 'recursive ls'
alias lp="ls++"             # https://github.com/trapd00r/ls--

# Custom completions Tab Complete
complete -cf optirun

# Import all bash-completions
# Arch Linux
[ -r /usr/share/bash-completion/bash_completion ] && {
    . /usr/share/bash-completion/bash_completion
} || {
    # Debian/ubuntu    
    [ -r /etc/bash_completion ] && { 
        . /etc/bash_completion
    }
}

# prints git branch of pwd
__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}

# print indicators for certain vars
__make_flags()
{
    local f=
    [ -z ${SSH_CLIENT%% *} ] || f="$f$(tput setaf 11)s"
    [ -z $VIMRUNTIME ] || f="$f$(tput setaf 5)v"

    [ -z $f ] || {
        f="$f$(tput sgr0)"
        printf "[%b]" "$f";
    }
}
