# Tooling configuration steps

1. Installs: 
  - Stow: `brew install stow`
  - Neovim: `brew install neovim`
  - Lang servers:
    - TS: `npm install -g typescript typescript-language-server`
    - ESLint: `npm i -g vscode-langservers-extracted`
    - Lua: `brew install lua-language-server`
  - Tmux: `brew install tmux`
  - Gitmux: `brew tap arl/arl && brew install gitmux`
1. Clone .dotfiles at the top level `~/.dotfiles`
1. Stow the config folders:
  - `cd ~/.dotfiles && stow nvim tmux`

# Tooling TODO

- start with ansible and create ansible config
- use zsh across systems and create zsh config

# LazyGit TODO

- add pax theme (could be manually done for now)

# Neovim TODO

## Neovim

- move across to eslint_d and prettierd
- when using zsh everywhere, investigate zsh style `completeopt`

## Plugins

- nui
  - build a custom rename
  - build a custom diagnostics thing (can then remove the diagnostic line indicators)
- fzf
  - add full path to top of preview window
  - find how to export all to quickfix list
  - apply theme colours
  - automatically go to a single result with gd
- helpers
  - create a react component folder
  - populate args list with component files (ie component, tests and css)

# Pax TODO

- figure out how to compile/build the theme
- figure out where the repo should live (should it be in dotfiles?)
- when diagnostic line indicators removed, want to colour the code to show what is generating errors vs warnings

# Tmux TODO

- figure out a good shortcut that works with vim for `tmux kill-pane -a`
- setup gitmux
- add pax theme (could be manually done for now)
- add TPM (https://github.com/tmux-plugins/tpm)
- add a pomodoro timer plugin (pomodoro plus)
- make command to spawn a window running the jest tests on the current file
