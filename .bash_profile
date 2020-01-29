# ~/.bash_profile

# Path Additions
export PATH=$PATH:$HOME/code/scripts
export PATH=$PATH:$HOME/code/scripts/$(hostname)
export PATH=$PATH:/usr/local/avr32/bin
export PATH=$PATH:/usr/local/xtensa-esp32-elf/bin
export PATH=$PATH:/opt/esp-open-sdk/xtensa-lx106-elf/bin

export PROMPT_COMMAND="stty sane"

export WINEARCH=win32
export EDITOR="vim"
export PYTHONSTARTUP=$HOME/.pyrc
export MOZ_USE_XINPUT2=1
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'

[[ -f ~/.bashrc ]] && . ~/.bashrc
