#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set_prompt_style () {
  local USER_COLOR="\[\033[0;36m\]"   #Light Blue
  local DIR_COLOR="\[\033[1;32m\]"    #Light Green
  local SYMBOL="$"

  if [ `whoami` == "root" ] ; then
    USER_COLOR="\[\033[0;31m\]"       #Light Red
    DIR_COLOR=$USER_COLOR
    SYMBOL="#"
  fi

  #PS1="[\[\e[36m\]\h\[\e[0m\]][\[\e[1;32m\]\w\[\e[0m\]]"
  PS1="[$USER_COLOR\h\[\e[0m\]][$DIR_COLOR\w\[\e[0m\]]$SYMBOL "

}

set_prompt_style

export WINEARCH=win32
export EDITOR="vim"
#PATH=/home/anthony/code/scripts:$PATH

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


# Shortcuts
#################
alias open="xdg-open"	# like OSX, open the default application


complete -cf sudo
complete -cf man


# Java Stuff
#export CLASSPATH=${CLASSPATH}:/usr/share/java/jogl/jogl.jar
#export CLASSPATH=${CLASSPATH}:/usr/share/java/jogl/gluegen-rt.jar
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/jogl/jogl-1.1.1-rc6/lib
