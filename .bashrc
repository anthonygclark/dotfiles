# ------~------~
# Anthony Clark
# ------~------~
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shopt
shopt -s histappend
shopt -s checkwinsize

# Import all bash-completions
[[ -r /usr/share/bash-completion/bash_completion ]]                      \
    && { source  /usr/share/bash-completion/bash_completion; }           \
    || { [[ -r /etc/bash_completion ]] && source /etc/bash_completion; }

# prints git branch of pwd
__git_ps1_ () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [[ -n "$b" ]]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}

# print indicators for certain vars
__make_flags()
{
    local PURPLE=$(tput setaf 5)
    local ORANGE=$(tput setaf 11)
    local END=$(tput sgr0)

    local f=
    [[ -z ${SSH_CLIENT%% *} ]]  || f="$f\[$ORANGE\]s"
    [[ -z $VIMRUNTIME ]]        || f="$f\[$PURPLE\]v"

    [[ -z $f ]] || {
        f="$f\[$END\]"
        printf "[%b]" "$f";
    }
}


# Prompt for users.
__user_prompt()
{
    local GREEN=$(tput setaf 2)
    local BLUE=$(tput setaf 4)
    local TEAL=$(tput setaf 6)
    local END=$(tput sgr0)
    local BOLD=$(tput bold)
    PS1="[\[$TEAL\]\h\[$END\]]$(__make_flags)[\[$BOLD$GREEN\]\w\[$END\]]\$(__git_ps1_ '(%s)')\\$ "
    PS2="\[$BLUE\]$PS2\[$END\]"
}

# Prompt for root user, red and red.
__root_prompt()
{
    local RED=$(tput setaf 1)
    local END=$(tput sgr0)
    local BOLD=$(tput bold)
    PS1="[\[$RED\]\h\[$END\]]$(__make_flags)[\[$BOLD$RED\]\w\[$END\]]\$ "
}

# To color or not to color
color_prompt=

if [[ "$color_prompt" =~ "no" ]] ; then
    PS1='[\u@\h \W]\$ '
elif which tput &> /dev/null && tput setaf 1 &>/dev/null; then 
    case $((UID)) in
        0)  # root
            __root_prompt
            ;;
        *)
            __user_prompt
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
alias la="ls -a"                # show hidden files
alias lx="ls -lXB"              # sort by extension
alias lk="ls -lSr"              # sort by size, biggest last
alias lc="ls -ltcr"             # sort by and show change time, most recent last
alias lu="ls -ltur"             # sort by and show access time, most recent last
alias lt="ls -ltr"              # sort by date, most recent last
alias lm="ls -al |more"         # pipe through 'more'
alias lr="ls -lR"               # recursive ls
alias lsr="tree -Csu"           # nice alternative to 'recursive ls'
alias lp="ls++"                 # https://github.com/trapd00r/ls--
alias sdate="date +%F_%H_%M_%S" # unix filename friendly date format
alias fh="find . -iname"        # find here

unset __make_flags
unset __root_prompt
unset __user_prompt
