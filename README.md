# dotfiles
Version control $HOME/ configuration files

Using vim-plug to manage vim plugins. Regular maintenance: https://github.com/junegunn/vim-plug#commands
Mainly:
  * `:PlugInstall`
  * `:PlugUpdate`

The idea of arrangement of vim configs is as follows:
  * the .vimrc has hotkeys to quick edit (<leader>e) and auto source on save
  * hence all volatile settings go in there
  * all stable settings get delegated to vimrcs folder (pro: clean and lean .vimrc, con: they won't hotupdate)
