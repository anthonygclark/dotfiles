# ~/.bash_profile

# Path Additions
export PATH=$PATH:$HOME/code/scripts
export PATH=$PATH:$HOME/code/scripts/$(hostname)
export WINEARCH=win32
export EDITOR="vim"
export PYTHONSTARTUP=$HOME/.pyrc

#export __GL_SYNC_TO_VBLANK=1 
#export __GL_SYNC_DISPLAY_DEVICE=DVI-I-1
#export __VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DVI-I-1

[[ -f ~/.bashrc ]] && . ~/.bashrc
