# ------~------~
# Anthony Clark
# ------~------~
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ $TERM =~ "xterm" ]] && TERM=xterm-256color

color_prompt="yes"

# Shopt
#shopt -s histappend
shopt -s checkwinsize

# Import all bash-completions
if [[ -r /usr/share/bash-completion/bash_completion ]] ; then
    source  /usr/share/bash-completion/bash_completion
fi

if [[ -r /etc/bash_completion ]] ; then
    source /etc/bash_completion
fi

function __git_ps1_ ()
{
    local b
    b=$(git symbolic-ref HEAD 2>/dev/null)

    if [[ -n "$b" ]]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}

function __make_flags()
{
    local BLUE
    local GREEN
    local PURPLE
    local ORANGE
    local END

    BLUE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 5)
    ORANGE=$(tput setaf 3)
    END=$(tput sgr0)

    local f
    [[ ! -z ${SSH_CLIENT%% *} ]]  && f="${f}${ORANGE}s"
    [[ ! -z $VIMRUNTIME ]]        && f="${f}${PURPLE}v"
    [[ ! -z $STY        ]]        && f="${f}${GREEN}n"
    [[ ! -z $TMUX       ]]        && f="${f}${BLUE}t"

    if [[ ! -z $f ]] ; then
        printf "[%b]" "${f}${END}"
    fi
}

function __user_prompt()
{
    local GREEN
    local BLUE
    local TEAL
    local END
    local BOLD

    GREEN=$(tput setaf 2)
    BLUE=$(tput setaf 4)
    TEAL=$(tput setaf 6)
    END=$(tput sgr0)
    BOLD=$(tput bold)

    PS1="[${TEAL}\h${END}]$(__make_flags)[${BOLD}${GREEN}\w${END}]\$(__git_ps1_ '(%s)')\\$ "
    PS2="${BLUE}${PS2}${END}"
}

function __root_prompt()
{
    local RED
    local END
    local BOLD

    RED=$(tput setaf 1)
    END=$(tput sgr0)
    BOLD=$(tput bold)

    PS1="[${RED}\h${END}]$(__make_flags)[${BOLD}${RED}\w${END}]\$ "
}


if [[ "$color_prompt" =~ "no" ]] ; then
    PS1="[\u@\h \W]\$ "
elif command -v tput &> /dev/null && tput setaf 1 &>/dev/null; then
    case $(( UID )) in
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
alias la="ls -a"                        # show hidden files
alias lx="ls -lXB"                      # sort by extension
alias lk="ls -lSr"                      # sort by size, biggest last
alias lc="ls -ltcr"                     # sort by and show change time, most recent last
alias lu="ls -ltur"                     # sort by and show access time, most recent last
alias lt="ls -ltr"                      # sort by date, most recent last
alias lm="ls -al |more"                 # pipe through 'more'
alias lr="ls -lR"                       # recursive ls
alias lsr="tree -Csu"                   # nice alternative to 'recursive ls'
alias lp="ls++"                         # https://github.com/trapd00r/ls--
alias sdate="date +%F_%H_%M_%S"         # unix filename friendly date format
alias fh="find . -iname"                # find here
alias size_here="du -d 1 -hc | sort -h" # finds the size of the current directory
alias atree="tree --charset=ASCII"      # tree with print friendly chars
alias open="xdg-open"                   # OSX-like open... breaks OSX obviously

unset __make_flags
unset __root_prompt
unset __user_prompt
