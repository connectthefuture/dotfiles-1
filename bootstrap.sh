dir=~/dotfiles
olddir=~/dotfiles_old
files=".zshrc .tmux.conf .tmuxline.conf .vimrc .vim .gitconfig .oh-my-zsh-custom"

#sudo apt-get update && sudo apt-get install zsh vim
#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
#chsh -s `which zsh`
if [ ! -d "$olddir" ]; then
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    echo "...done"
fi

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

git submodule update --init

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    if [ -e "$file" ]; then
        echo "Moving ~/$file to $olddir"
        mv ~/$file ~/dotfiles_old/
    fi

    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

cd ~ && source .zshrc
