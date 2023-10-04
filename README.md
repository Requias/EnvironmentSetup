# EnvironmentSetup

# Install packages before starting
```sh
sudo apt install build-essential cmake cscope cscope-indexer ctags ctags-exuberant dpkg-dev python3-dev vim vim-gtk3 vimdiff
```
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
```
```sh
~/.fzf/install
```

# Download setup files
```sh
git clone https://github.com/Requias/EnvironmentSetup.git
```

# Put the following files in ~ or copy the contents to the existing files
```sh
cp -rf EnvironmentSetup/{.bash_aliases,.bash_profile,.bashrc,.fzf.bash,.fzf.zsh,.gitconfig,.vimrc} ~
```

# Open any file with vim and install plugins
```sh
vim ~/.vimrc
```
```sh
:qa
```

# Put the following script in the root directory of the project and run the script
build_project.sh
