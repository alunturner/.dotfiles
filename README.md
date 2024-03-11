# Tooling configuration code - add steps as we go

1. Install Stow: `brew install stow` OR `sudo apt install stow`
1. put the .dotfiles directory at the top level, ie ~/.dotfiles on mac
1. Stow the config folder: `cd ~/.dotfiles && stow nvim` (will be same for tmux when that config is written)

# Nvim TODO

- create a pax colour scheme using lush
- remove vscode theme
- use pax theme (when created)
- remove treesitter context
- look at nvim reactive to make mode be reflected by number/currentline
  - may then be able to remove the command line completely/move it somewhere more central on the view
  - this idea of moving cmd line may involve looking at dressing.nvim, or noice.nvim, or nui.nvim if doing custom job
  - (example of how to build using nui)[https://muniftanjim.dev/blog/neovim-build-ui-using-nui-nvim/]
- switch from telescope to fzf-lua
- switch from mini.complete to nvim-cmp (and use ghost text completion)
- remove mason/mason-lsp
- checkout deathbeam's config (including autocomplete.nvim, potentially a good starting point for custom complete)
- look at arrow.nvim (navigation type thing)
- look at corn.nvim (diagnostic display in a corner)
- look at nvim-coverage (displays lcov data in the colour column)
- use leader remaps as the main nvim indicator
- try to use single leader where possible, or consistent leader/modifiers if not possible, eg:
  - \_f => finder stuff, \_q => quickfix stuff etc.
  - \_<something>t => toggle <something>

# Tmux TODO

- could make a command to spawn a window running the jest tests on the current file
