# ------~------~
# Anthony Clark
# ------~------~
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ `whoami` == "root" ] ; then
  export PS1='[\[\e[0;31m\]\h\[\e[0m\]][\[\e[0;31m\]\w\[\e[0m\]]\# \[$(tput sgr0)\]'
else
  # Assuming you have git-completion and git
  export PS1='[\[\e[0;36m\]\h\[\e[0m\]][\[\e[1;32m\]\w\[\e[0m\]]$(__git_ps1 "(%s)")\$ \[$(tput sgr0)\]'
fi

# Various globals
export WINEARCH=win32
export EDITOR="vim"

#The 'ls' family (in all it's glory)
####################################
alias ll="ls -l --group-directories-first"
alias ls="ls --color=auto"  # add colors for filetype recognition, THIS BREAKS in OSX
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

# misc Shortcuts
#################
alias open="xdg-open"	# like OSX, open the default application

# Tab Complete
complete -cf sudo
complete -cf man

# prints git branch of pwd
__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}
