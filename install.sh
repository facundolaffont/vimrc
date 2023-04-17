echo "Installing for user $USER:"
if [[ ! -a $HOME/.vim/vimrc ]]
then
    curl -sS https://raw.githubusercontent.com/facundolaffont/vimrc/main/vimrc > $HOME/.vim/vimrc
    echo -e "\t- vimrc was copied."
else
    echo -e "\t- vimrc already exists."
fi

if [[ ! -a $HOME/.vim/autoload/plug.vim ]]
then
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo -e "\t- VimPlug was installed."
else
    echo -e "\t- VimPlug already exists."
fi

if [[ ! -d $HOME/.vim/pack/plugins/start/ctrlp ]]
then
    mkdir -p $HOME/.vim/pack/plugins/start
    git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git $HOME/.vim/pack/plugins/start/ctrlp
    echo -e "\t- ctrlp was installed."
else
    echo -e "\t- ctrlp already exists."
fi

vim +PlugInstall +qall &
