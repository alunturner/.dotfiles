# THIS WILL BE ARCHIVED

As at 17 Oct 24, this will be going in the direction of nix.
Please see https://www.github.com/alunturner/nix-darwin-configuration and https://www.github.com/alunturner/home-manager for what's going on.

# Tooling configuration steps

1. Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install nvm and node (tbc)

3. Install Brew packages (Ripgrep, fzf, fd, stow, neovim, lua formatter and lang server, tmux, starship)

```bash
brew install ripgrep fzf fd stow neovim stylua lua-language-server tmux starship
```

4. Install Wezterm

```bash
brew install --cask wezterm
```

5. Install npm packages (TS, ESLint, CSS lang servers, daemons)

```bash
npm i -g typescript typescript-language-server vscode-langservers-extracted css-variables-language-server cssmodules-language-server nodemon @fsouza/prettierd
```

6. Clone .dotfiles at the top level `~/.dotfiles`, recursive because we use submodules

```bash
cd && git clone --recurse-submodules https://github.com/alunturner/.dotfiles.git
```

7. Stow the config folders:

```bash
cd ~/.dotfiles && stow nvim tmux lazygit wezterm starship
```

8. If not on Wezterm, set terminal colours to Catpuccin Mocha/Latte and override fg color #e9e7dd / #19191f

# TODO

- Ansible: start with ansible and create ansible config
- Pax: make a light theme, accept a highlight count, look at ts highlight groups
- Neovim:
  - finder.lua - make diagnostic finder severity toggleable
  - move lsp autocmd outside (use this as a pattern for autocmds if possible)
