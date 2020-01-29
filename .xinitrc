#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# Fix QT Apps
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Background
xsetroot -solid grey31

# fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/artwiz-fonts
xset fp rehash

# Screen lock
xautolock -time 5 -locker slock &

# MPDSCRIBBLE
USE_MPDSCRIBBLE=false

# mpd
if which mpd &>/dev/null;
then
    mpd &
    if $USE_MPDSCRIBBLE && which mpdscribble &>/dev/null;
    then
        mpdscribble &
    fi
fi

# Fix Java Swing
if which wmname &>/dev/null;
then
    wmname LG3D
fi

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# For gnome services
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# dunst
dunst &

# dzen2
DZEN="$HOME/code/scripts/$(hostname)/dzen.sh"

if which $DZEN &>/dev/null;
then
    $(sleep 2 ; bash $DZEN) &
fi

# DWM
while true;
do
  dwm >/tmp/dwm.log 1>&1
done
