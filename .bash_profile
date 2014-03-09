# ~/.bash_profile

# Path Additions
export PATH=$PATH:$HOME/code/scripts
export PATH=$PATH:$HOME/code/scripts/$(hostname)
export WINEARCH=win32
export EDITOR="vim"
export PYTHONSTARTUP=$HOME/.pyrc

[[ -f ~/.bashrc ]] && . ~/.bashrc
