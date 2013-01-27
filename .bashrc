# ------~------~
# Anthony Clark
# ------~------~
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# To color or not to color
color_prompt=

if which tput > /dev/null && tput setaf 1 >&/dev/null; then 
  color_prompt=yes
fi

if [ "$color_prompt" = yes ] ; then
  case `whoami` in
    root)
      export PS1='[\[\e[0;31m\]\h\[\e[0m\]][\[\e[0;31m\]\w\[\e[0m\]]\# \[$(tput sgr0)\]'
    ;;
    *)
      export PS1='[\[\e[0;36m\]\h\[\e[0m\]][\[\e[1;32m\]\w\[\e[0m\]]$(__git_ps1 "(%s)")\$ \[$(tput sgr0)\]'
    ;;
  esac

  # color specific aliases
  alias ls="ls --color=auto" # THIS BREAKS in OSX

else
    export PS1='[\u@\h \W]\$ '
fi

# Various vars
export WINEARCH=win32
export EDITOR="vim"

# Path Additions
export PATH=$PATH:/home/anthony/code/scripts

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

# Import all bash-completions (if they exist)
# Also, install bash-completions package
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Shopt
shopt -s histappend
shopt -s checkwinsize

# prints git branch of pwd
__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}
