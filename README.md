# Tooling configuration code - add steps as we go

1. Install Stow: `brew install stow` OR `sudo apt install stow`
1. put the .dotfiles directory at the top level, ie ~/.dotfiles on mac
1. Stow the config folder: `cd ~/.dotfiles && stow nvim` (will be same for tmux when that config is written)

# Nvim TODO

- create a pax colour scheme using lush
- use pax theme (when created)
- look at nvim reactive to make mode be reflected by number/currentline
  - may then be able to remove the command line completely/move it somewhere more central on the view
  - this idea of moving cmd line may involve looking at dressing.nvim, or noice.nvim, or nui.nvim if doing custom job
  - (example of how to build using nui)[https://muniftanjim.dev/blog/neovim-build-ui-using-nui-nvim/]
- remove mason/mason-lsp
- checkout deathbeam's config (including autocomplete.nvim, potentially a good starting point for custom complete)
- look at arrow.nvim (navigation type thing)
- look at nvim-coverage (displays lcov data in the colour column)
- use leader remaps as the main nvim indicator
- try to use single leader where possible, or consistent leader/modifiers if not possible, eg:
  - \_f => finder stuff, \_q => quickfix stuff etc.
  - \_<something>t => toggle <something>
- look at netrw settings for default behavior
  - let g:netrw_banner=0
  - let g:netrw_browse_split=4
  - let g:netrw_altv=0
  - let g:netrw_liststyle=0
- look at stay_centered (always keeps the cursor in the centre of the screen, like a typewriter!)
- look at centerpad.nvim and no-neck-pain and then create an ultra basic centring plugin

# Tmux TODO

- add the pax theme to tmux too
- could make a command to spawn a window running the jest tests on the current file
- add TPM (https://github.com/tmux-plugins/tpm)
- add a pomodoro timer plugin
- add a git branch display plugin
