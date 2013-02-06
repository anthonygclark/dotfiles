#!/bin/bash
# Anthony Clark
#
# Installs dotfiles, creating a backup of the
# old dotfiles

# Change into the script dir
script_dir=$(dirname $(readlink -m $0))
echo "Changing dirs to $script_dir"
cd $script_dir


# Some vars
_date=$(date +%F_%H_%M_%S)
out="$HOME/dotfiles_backup_$_date.tar"
declare -A f # New
declare -A e # Old


# Fail func, just prints fail string
fail() {
    echo "Failure: $1"
    exit 1
}


# Build array of these dotfiles
for i in $(ls -a | grep -v -E '(\.git$|\.gitignore|*.patch|README|install.sh|\.$)'); do
    f[${#f[@]}]="$i"
done


# Build array of dotfiles that match the current dotfiles
# for backup
for i in ${f[@]}; do
    if [ -z $(ls -a $HOME | grep -x $i) ]; then
        continue
    fi
    echo "Found old dotfile: $i"
    e[${#e[@]}]="$i"
done


# if we found old dotfiles...
[ -z ${e} ] || {    
    # backup
    cd $HOME
    tar -cf $out ${e[@]} &>/dev/null || fail "tar"
    echo "[+] Backing up old dotfiles to $out"
    cd $script_dir

    # Delete
    for i in ${e[@]}; do rm -r $HOME/$i || fail "remove"; done
    echo "[+] Deleted old dotfiles."
}


# Install
for i in ${f[@]}; do 
    cp -r $i $HOME/ || fail "copy"
done
echo "[+] New dotfiles installed"


# The generic option removed my user info from
# gitconfig and remove my color prefs from .vimrc
cd $HOME
echo -ne "Make these dotfiles generic? [y/n]?: "
read ans
if [ ${ans,,} == "y" ] ; then
    patch -p1 < $script_dir/generic.patch || fail "patch"
fi


exit 0
