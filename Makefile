# Anthony Clark
# Installer for dotfiles

install:
tar -cvf ~/old_dotfiles.tar ~/.vim/ ~/.vimrc ~/.bashrc ~/.Xdefaults
cp -r .* ~/

# dont do this unless you are sure
restore:
tar -cvf ~/temp.tar ~/.vim/ ~/.vimrc ~/.bashrc ~/.Xdefaults
rm -r .vim .vimrc .Xdefaults .bashrc
tar -xvf ~/old_dotfiles.tar
rm old_dotfiles.tar
