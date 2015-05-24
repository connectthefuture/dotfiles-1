dir=~/dotfiles                    
olddir=~/dotfiles_old            
files=".zshrc .tmux.conf .tmuxline.conf .vimrc .vim .gitconfig .oh-my-zsh-custom"

sudo apt-get update && sudo apt-get install zsh vim
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s `which zsh`

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
 
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

git submodule update --init

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done 
