#!/bin/bash
d=$(date +%F_%H_%M_%S)
out="$HOME/dotfiles_backup_$d.tar"
declare -A f

fail() {
  echo "Failure"
  exit 1
}

for i in $(ls -a); do
  # Filter out unwanted 
  if [ $i == "." -o $i == ".."  -o $i == "README" -o $i == $0 -o $i == ".git" ] ; then
    continue
  fi
  # Add to array
  f[${#f[@]}]="$HOME/$i"
done

tar -cf $out ${f[@]} &>/dev/null || fail
echo "[+] Backing up old dotfiles to $out"

for i in ${f[@]}; do rm -r $i || fail ; done
echo "[+] Deleted old dotfiles."

for i in ${f[@]}; do 
  cp -r $i $HOME
done
echo "[+] New dotfiles installed"
