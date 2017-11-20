### Setup

Make a backup of nvim config, if there is one.

`mv -v ~/.config/nvim ~/.config/nvim_backup`

Clone config into ~/.config/nvim.

`git clone https://github.com/alexdreptu/nvim-config ~/.config/nvim`

[vim-plug](https://github.com/junegunn/vim-plug) and all the plugins will be automatically installed when vim starts for the first time.

### Update vim scripts / plugins

`vim +PlugUpdate +qall`

### Update vim-plug

`vim +PlugUpgrade +q`
