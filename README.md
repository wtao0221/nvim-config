# nvim-config
nvim-config

### Dependencies
```
sudo apt update
sudo apt install -y libtool libtool-bin unzip gettext silversearcher-ag ctags software-properties-common npm
```

### neovim Installation

https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source

```
# build from source
git clone git@github.com:neovim/neovim.git
cd neovim
git checkout v0.8.1

make CMAKE_BUILD_TYPE=Release

sudo make install
```

### Configuration
```
# .config/nvim/init.vim
```

### Install the plugin
```
# plug manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# YCM
mkdir -p ~/.config/nvim/bundle
cd ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/ycm-core/YouCompleteMe.git --recursive
cd YouCompleteMe
./install.py --all

# Github Copilot
:Copilot setup
```
