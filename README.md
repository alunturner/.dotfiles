# Tooling configuration steps

1. Installs:

- Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Zsh: on mac: `brew install zsh`, on wsl: `sudo apt install zsh`
  - change shell to zsh `chsh -s $(which zsh)`
- Ripgrep: `brew install ripgrep`
- Fzf: `brew install fzf`
- fd: `brew install fd`
- Stow: `brew install stow`
- Neovim: `brew install neovim`
- Stylua: `brew install stylua`
- Lang servers:
  - TS: `npm install -g typescript typescript-language-server`
  - ESLint: `npm i -g vscode-langservers-extracted`
  - Lua: `brew install lua-language-server`
  - CSS variables: `npm i -g css-variables-language-server`
  - CSS modules: `npm install -g cssmodules-language-server`
- Tmux: `brew install tmux`
- Gitmux: `brew tap arl/arl && brew install gitmux`
- JS daemons
  - nodemon: `npm i -g nodemon`
  - prettierd: `npm i -g fsouza/prettierd` or `brew install prettierd`
  - eslint_d: `npm i -g eslint_d`

1. Clone .dotfiles at the top level `~/.dotfiles`
1. Stow the config folders:

- `cd ~/.dotfiles && stow nvim tmux lazygit zsh`

1. If not on Wezterm, set terminal colours to Catpuccin Mocha/Latte with overrides:

- fg color #e9e7dd / #19191f

# TODO

- Ansible: start with ansible and create ansible config
- Neovim: remove diagnostic line letters
- Neovim: make single pax theme that can accept variable highlight count
