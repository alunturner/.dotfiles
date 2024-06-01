# Tooling configuration steps

1. Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install nvm and node (tbc)
3. Install Brew packages (Ripgrep, fzf, fd, stow, neovim, lua formatter and lang server, tmux)

```bash
brew install ripgrep fzf fd stow neovim stylua lua-language-server tmux
```

4. Install Gitmux

```bash
brew tap arl/arl && brew install gitmux
```

5. Install Wezterm

```bash
brew install --cask wezterm
```

6. Install npm packages (TS, ESLint, CSS lang servers, daemons)

```bash
npm i -g typescript typescript-language-server vscode-langservers-extracted css-variables-language-server cssmodules-language-server nodemon @fsouza/prettierd eslint_d
```

7. Clone .dotfiles at the top level `~/.dotfiles`

```bash
cd && git clone https://github.com/alunturner/.dotfiles.git
```

8. Stow the config folders:

```bash
cd ~/.dotfiles && stow nvim tmux lazygit wezterm zsh
```

9. If not on Wezterm, set terminal colours to Catpuccin Mocha/Latte and override fg color #e9e7dd / #19191f

# TODO

- Ansible: start with ansible and create ansible config
- Pax: make a light theme, accept a highlight count, look at ts highlight groups
- Neovim:
  - custom motions/text objects for quotes, brackets, strings, lists etc.
  - move abbreviations to /after/ftplugin if doable for ecmascript
  - finder.lua - add title to help finder and make diagnostics display errors only, toggleable to show all
  - can nvim.lint go??? test on work system, could remove eslint_d install too
  - move lsp autocmd outside (use this as a pattern for autocmds if possible)
  - treesitter.lua - turn custom commands on after further testing
  - add insert mode <C-k> bind to show signature
- Remove zsh config and add starship
- Tmux: add full border for splits - need better pane differentiation
