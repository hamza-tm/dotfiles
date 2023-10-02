# dotfiles
Version control $HOME/ configuration files. Guide here: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

To set up on a new windows machine (wsl)
  * zsh (`sudo apt-get install zsh`)
  * oh-my-zsh! (`curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`)
  * zsh plugins, manually using oh-my-zsh as plugin manager:
    * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
  * nvim (`sudo apt-get install neovim`)
  * tmux plugin manager (`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`) (used by tmux conf in dotfiles)
  * `git clone --separate-git-dir=$HOME/dotfiles git@github.com:hamza-tm/dotfiles.git ~`
  * install nvm (`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`)
  * nvm (open zsh, then `nvm install stable`)
  * Yarn (`npm i -g yarn`) see https://yarnpkg.com/getting-started/install
  * run vim, ignore all the errors, `:PlugInstall`
  * Install coc packages
    * `cd /home/hamza/.config/coc/extensions/`
    * `yarn`
  * lazygit via asdf (PPA no longer gets updates on Ubuntu)
    * `asdf plugin add lazygit`
    * `asdf install lazygit latest`
    * `asdf global lazygit latest`
  * Hack font (so zsh prompt renders correctly)
    * Install for windows, then set in terminal properties
  * two-way clipboard between wsl vim and Windows
    * `curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip`
    * `unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe`
    * `chmod +x /tmp/win32yank.exe`
    * `mv /tmp/win32yank.exe ~/bin`


Alternative if git clone doesn't work:
```
git clone --separate-git-dir=$HOME/dotfiles git@github.com:hamza-tm/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

## Notes

Using vim-plug to manage vim plugins. Regular maintenance: https://github.com/junegunn/vim-plug#commands
Mainly:
  * `:PlugInstall`
  * `:PlugUpdate`

The idea of arrangement of vim configs is as follows:
  * the .vimrc has hotkeys to quick edit (<leader>e) and auto source on save
  * hence all volatile settings go in there
  * all stable settings get delegated to vimrcs folder (pro: clean and lean .vimrc, con: they won't hotupdate)
