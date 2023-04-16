# vimrc

Vim vimrc config file.

## Installation

### Windows

```powershell
curl -sS https://raw.githubusercontent.com/facundolaffont/vimrc/main/vimrc > $HOME\vimfiles\vimrc
```

### Linux

```sh
curl -sS https://raw.githubusercontent.com/facundolaffont/vimrc/main/vimrc > $HOME/.vim/vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
mkdir -p ~/.vim/pack/plugins/start && \
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
```

If you also want to apply this configs to root account:

```sh
curl -sS https://raw.githubusercontent.com/facundolaffont/vimrc/main/vimrc /root/.vim/vimrc && \
curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
mkdir -p /root/.vim/pack/plugins/start && \
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git /root/.vim/pack/plugins/start/ctrlp
```

## Plugins that I use

+ [VimPlug](https://github.com/junegunn/vim-plug)
+ [NERDTree](https://github.com/preservim/nerdtree)
+ [Emmet](https://github.com/mattn/emmet-vim)
+ [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)

## Next

+ Make line moving work in Mac version.
+ Add plugins installation.
+ Add code to install plugins using Vim 8 packages.
