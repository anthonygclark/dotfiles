# ------~------~
# Anthony Clark
# ------~------~
#
# Alloe GIT autocomplete and other GIT stuff
source /usr/share/git/completion/git-completion.bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ `whoami` == "root" ] ; then
  export PS1='[\[\e[0;31m\]\h\[\e[0m\]][\[\e[0;31m\]\w\[\e[0m\]]\# \[$(tput sgr0)\]'
else
  export PS1='[\[\e[0;36m\]\h\[\e[0m\]][\[\e[1;32m\]\w\[\e[0m\]]$(__git_ps1 "(%s)")\$ \[$(tput sgr0)\]'
fi

# Various globals
export WINEARCH=win32
export EDITOR="vim"

#The 'ls' family (in all it's glory)
####################################
alias ll="ls -l --group-directories-first"
alias ls="ls --color=auto"  # add colors for filetype recognition
alias la="ls -a"            # show hidden files
alias lx="ls -lXB"          # sort by extension
alias lk="ls -lSr"          # sort by size, biggest last
alias lc="ls -ltcr"         # sort by and show change time, most recent last
alias lu="ls -ltur"         # sort by and show access time, most recent last
alias lt="ls -ltr"          # sort by date, most recent last
alias lm="ls -al |more"     # pipe through 'more'
alias lr="ls -lR"           # recursive ls
alias lsr="tree -Csu"       # nice alternative to 'recursive ls'

# Git Shortcuts (these are ugly)
####################################
alias gitl="git log --pretty='format:%Cgreen%H %Cred%ai %Creset- %s'"


# Highlight shortcuts
####################################
alias highlightc="highlight -S c -O xterm256"
alias highlightj="highlight -S java -O xterm256" 

# misc Shortcuts
#################
alias open="xdg-open"	# like OSX, open the default application

# Tab Complete
complete -cf sudo
complete -cf man
