# Tooling configuration steps

1. Installs:

1. Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. nvm and node (tbc)
1. Install brew packages (Ripgrep, fzf, fd, stow, neovim, lua formatter and lang server, tmux)

- `brew install ripgrep fzf fd stow neovim stylua lua-language-server tmux`

1. Install gitmux

- `brew tap arl/arl && brew install gitmux`

1. Install npm packages (TS, ESLint, CSS lang servers, daemons)

- `npm i -g typescript typescript-language-server vscode-langservers-extracted css-variables-language-server cssmodules-language-server nodemon @fsouza/prettierd eslint_d`

1. Clone .dotfiles at the top level `~/.dotfiles`
1. Stow the config folders:

- `cd ~/.dotfiles && stow nvim tmux lazygit zsh`

1. If not on Wezterm, set terminal colours to Catpuccin Mocha/Latte with overrides:

- fg color #e9e7dd / #19191f

# TODO

- Ansible: start with ansible and create ansible config
- Neovim: remove diagnostic line letters
- Neovim: make single pax theme that can accept variable highlight count
