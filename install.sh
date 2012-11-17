#!/bin/bash
d=$(date +%F_%H_%M_%S)
out="$HOME/dotfiles_backup_$d.tar"
this=$(basename $0)
declare -A f
declare -A e

fail() {
  echo "Failure: $1"
  exit 1
}

# Build array of these dotfiles
for i in $(ls -a); do
  # Filter out unwanted 
  if [ $i == "." -o $i == ".."  -o $i == "README" -o $i == $this -o $i == ".git" -o $i == ".gitignore" ] ; then
    continue
  fi
  # Add to array
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

tar -cf $out ${e[@]} &>/dev/null || fail "tar"
echo "[+] Backing up old dotfiles to $out"

for i in ${e[@]}; do rm -r $HOME/$i || fail "remove"; done
echo "[+] Deleted old dotfiles."

for i in ${f[@]}; do 
  cp -r $i $HOME || fail "copy"
done
echo "[+] New dotfiles installed"
