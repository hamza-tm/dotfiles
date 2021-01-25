# dotfiles
Version control $HOME/ configuration files. Guide here: https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html

To set up on a new machine
  * zsh (`sudo apt-get install zsh`)
  * oh-my-zsh! (`curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`)
  * zsh plugins, manually using oh-my-zsh as plugin manager:
    * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
  * nvim (`sudo apt-get install neovim`)
  * `git clone --separate-git-dir=$HOME/dotfiles git@github.com:hamza-tm/dotfiles.git ~`
  * run vim, ignore all the errors, `:PlugInstall`
  * lazygit
    * `sudo add-apt-repository ppa:lazygit-team/release`
    * `sudo apt-get update`
    * `sudo apt-get install lazygit`
  * Hack font

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
