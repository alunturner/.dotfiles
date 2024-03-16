# Tooling configuration code - add steps as we go

1. Install Stow: `brew install stow` OR `sudo apt install stow`
1. put the .dotfiles directory at the top level, ie ~/.dotfiles on mac
1. Stow the config folder: `cd ~/.dotfiles && stow nvim` (will be same for tmux when that config is written)

# Tooling TODO

- start with ansible and create ansible config
- use zsh across systems and create zsh config

# LazyGit TODO

- add pax theme (could be manually done for now)

# Neovim TODO

## Neovim

- look at netrw settings for default behavior
  - let g:netrw_banner=0
  - let g:netrw_browse_split=4
  - let g:netrw_altv=0
  - let g:netrw_liststyle=0
- make `Esc` close netrw
- move across to eslint_d and prettierd
- when using zsh everywhere, investigate zsh style `completeopt`

## Plugins

- remove mason and mason-lsp
- remove no-neck-pain
- nui
  - build a custom rename
  - build a custom diagnostics thing (can then remove the diagnostic line indicators)
- fzf
  - stack panes vertically to allow paths to be seen
  - add full path to top of preview window
  - find how to export all to quickfix list
  - apply theme colours
  - automatically go to a single result with gd
- helpers
  - create a react component folder
  - populate args list with component files (ie component, tests and css)
  - add [] bindings for qf, args, buffers (]a => next arg ]A => last arg etc)

# Pax TODO

- figure out how to compile/build the theme
- figure out where the repo should live (should it be in dotfiles?)
- when diagnostic line indicators removed, want to colour the code to show what is generating errors vs warnings

# Tmux TODO

- figure out copy mode behaviour a bit better
- add a no-neck-pain type pane management replacement
- make the split bindings like neovim
- add pax theme (could be manually done for now)
- add TPM (https://github.com/tmux-plugins/tpm)
- add a pomodoro timer plugin (pomodoro plus)
- add a git branch display plugin (gitmux)
- make command to spawn a window running the jest tests on the current file
