# Tooling configuration steps

1. Installs:

- Zsh: `brew install zsh`
  - change shell to zsh `chsh -s $(which zsh)`
- Stow: `brew install stow`
- Neovim: `brew install neovim`
- Lang servers:
  - TS: `npm install -g typescript typescript-language-server`
  - ESLint: `npm i -g vscode-langservers-extracted`
  - Lua: `brew install lua-language-server`
- Tmux: `brew install tmux`
- Gitmux: `brew tap arl/arl && brew install gitmux`
- JS daemons
  - nodemon: `npm i -g nodemon`
  - prettierd: `npm i -g fsouza/prettierd`
  - eslint_d: `npm i -g eslint_d`

1. Clone .dotfiles at the top level `~/.dotfiles`
1. Stow the config folders:

- `cd ~/.dotfiles && stow nvim tmux lazygit zsh`

1. Set terminal colour to

- bg = #19191f (dark)
- fg = #e9e7dd (bright)
- cursor bg = #ff007b (hotpink)
- cursor fg = #e9e7dd (bright)

# Tooling TODO

- start with ansible and create ansible config

# Neovim TODO

## Neovim

- when using zsh everywhere, investigate zsh style `completeopt`
- move the theme colours out into a separate core folder

## Plugins

- nui
  - build a custom diagnostics thing (can then remove the diagnostic line indicators)
- fzf
  - find how to export all to quickfix list
- helpers
  - create a react component folder
  - populate args list with component files (ie component, tests and css)
  - make a centering plugin, don't like the current tmux solution

# Pax TODO

- make a common colours file that lists the used colours, not sure if these can be read into the other schemes
- when diagnostic line indicators removed, want to colour the code to show what is generating errors vs warnings

# Tmux TODO

- figure out a good shortcut that works with vim for `tmux kill-pane -a`
- transition to read theme colours when theme is compiled and built
- add a pomodoro timer plugin (pomodoro plus) from scratch
- make command to spawn a window running the jest tests on the current file
