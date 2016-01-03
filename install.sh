#!/bin/bash
# Anthony Clark
#
# Installs dotfiles, creating a backup of the
# old dotfiles

# Change into the script dir
script_dir=$(dirname $(readlink -m $0))
cd $script_dir

# Some vars
dest="$HOME"
_date=$(date +%F_%H_%M_%S)
out="dotfiles_backup_$_date.tar"

# Fail func, just prints fail string
function fail()
{
    echo "Failure: $1"
    exit 1
}

dotfiles=($(find . -type d '(' -name .svn -o -name .git ')' -prune -o \
    ! -iname 'install.sh' \
    ! -iname '*.patch' \
    ! -iname '.git*' \
    ! -iname 'README'))

_dirs=()

# Build array of these dotfiles
for i in ${dotfiles[@]}; do
    # gross...
    if [[ $i =~ ".git" ]]; then continue; fi
    if [[ $i == "." ]]; then continue; fi
    if [[ $i == ".." ]]; then continue; fi

    if [[ -d $i ]]; then
        _dirs[${#_dirs[@]}]=$i
        continue;
    fi

    f[${#f[@]}]=${i#./}
done

# Build array of dotfiles that match the current dotfiles for backup
for i in ${f[@]}; do
    if [[ ! -e $dest/$i ]]; then
        continue
    fi

    echo "Found old dotfile: $dest/$i"
    e[${#e[@]}]=$i
done


# Backup and remove old dotfiles
if [[ ! -z ${e[@]} ]]; then
    cd $dest

    # Backup
    tar -cf $out ${e[@]} || fail "tar"
    echo "[+] Backing up old dotfiles to $out"

    # Delete
    for i in ${e[@]}; do
        rm -fr "$i" || fail "remove, please restore from backup"
    done

    echo "[+] Deleted old dotfiles."
fi

cd $script_dir

# mkdirs
for i in ${_dirs[@]};
do
    mkdir -p $dest/$i || fail "mkdir -p"
done

# install files
for i in ${f[@]};
do
    cp -r $i $dest/$(dirname $i) || fail "copy"
done
echo "[+] New dotfiles installed"


# The generic option removed my user info from
# gitconfig and remove my color prefs from .vimrc
# and probably more
if [[ -e ${script_dir}/generic.patch ]];
then
    cd $dest
    echo -ne "Make these dotfiles generic? [y/n]?: "
    read ans
    if [ ${ans,,} == "y" ] ; then
        patch -p1 < $script_dir/generic.patch || fail "patch"
    else
        echo "Aborting Patch"
    fi
fi

# update bundles
git submodule init
git submodule update
vim +BundleUpdate +qall
vim +BundleInstall +qall

exit 0
