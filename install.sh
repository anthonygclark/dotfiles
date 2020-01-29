#!/bin/bash
# Anthony Clark
#
# Installs dotfiles via naive copying.
# It's pretty nasty so good luck!

# Change into the script dir
readonly script_dir="$(dirname "$(readlink -m "$0")")"
cd "$script_dir" || exit 1

while true; do
    read -r -p "Are you sure you want to do this? [y/n]: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

readonly dest="$HOME"
readonly _date=$(date +%F_%H_%M_%S)
readonly out="dotfiles_backup_$_date.tar"

readonly dotfiles=($(find . -type d '(' -name .svn -o -name .git ')' -prune -o \
    ! -iname 'install.sh' \
    ! -iname '*.patch' \
    ! -iname 'README'))

_dirs=()

# Fail func, just prints fail string
function fail()
{
    echo "Failure: $1"
    exit 1
}

# Build array of these dotfiles
for i in "${dotfiles[@]}";
do
    # gross...
    case "$i" in
        .git*) continue ;;
        .) continue ;;
        ..) continue ;;
    esac

    if [[ -d "$i" ]]; then
        _dirs[${#_dirs[@]}]="$i"
        continue;
    fi

    f[${#f[@]}]=${i#./}
done

# Build array of dotfiles that match the current dotfiles for backup
for i in "${f[@]}"; do
    if [[ ! -e $dest/$i ]]; then
        continue
    fi

    echo "Found old dotfile: $dest/$i"
    e[${#e[@]}]="$i"
done


# Backup and remove old dotfiles
if [[ ${#e[@]} -gt 0 ]];
then
    cd "$dest" || exit 1

    # Backup
    tar -cf "$out" "${e[@]}" || fail "tar"
    echo "[+] Backing up old dotfiles to $out"

    # Delete
    for i in "${e[@]}"; do
        rm -fr "$i" || fail "remove, please restore from backup"
    done

    echo "[+] Deleted old dotfiles."
fi

cd "$script_dir" || exit 1

# mkdirs
for i in "${_dirs[@]}";
do
    mkdir -p "$dest/$i" || fail "mkdir -p"
done

# install files
for i in "${f[@]}";
do
    cp -r "$i" "$dest/$(dirname "$i")" || fail "copy"
done

echo "[+] New dotfiles installed"

# The generic option removed my user info from
# gitconfig and remove my color prefs from .vimrc
# and probably more
if [[ -e "${script_dir}/generic.patch" ]];
then
    cd "$dest" || exit 1

    echo -ne "Make these dotfiles generic? [y/n]?: "
    read -r ans
    if [ "${ans,,}" == "y" ] ; then
        patch -p1 < "$script_dir/generic.patch" || fail "patch"
    else
        echo "Aborting Patch"
    fi
fi

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || fail "Failed to download vim-plug"

# Install user plugins
vim +PlugInstall +qall

echo "Done."
