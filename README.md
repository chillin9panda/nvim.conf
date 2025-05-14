# ***Neovim***
## Create backup of existing config
```bash
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

## Or delete everything
```bash
sudo rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

## Clone Config
```bash
git clone https://github.com/chillin9panda/nvim.conf.git ~/.config/nvim
``` 

## Mason Packages
```bash
MasonInstall black bash-language-server clang-format clangd cmake-language-server css-lsp eslint_d google-java-format html-lsp htmlhint intelephense jdtls lua-language-server php-cs-fixer prettier python-lsp-server shfmt some-sass-language-server stylua stylelint typescript-language-server
```
