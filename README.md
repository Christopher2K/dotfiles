# My dotsfiles & stuffs

This repository (now managed by chezMoi) contains my dotfiles and stuff I'd like to keep between my machines. Everything should work as expected on macOS.

## Requirements

### Few important tools

- Classic dependency manager: [brew](https://brew.sh/)
- Shell: [oh-my-zsh](https://ohmyz.sh/)
- Window manager: [yabai](https://github.com/koekeishiya/yabai)
- Widget manager: [Übersicht](https://github.com/felixhageloh/uebersicht)
- Editor: Neovim v0.9+
- Terminal: [Alacritty](https://github.com/alacritty/alacritty)
- Multiplexer: [Zellij](https://github.com/zellij-org/zellij)

### How to use

You can technically pick any file here and use it as a config file for the corresponding tool. If you want to get the full installation.

My `Brewfile` contains my go-to packages & software on macOS. You can install everything using the command `brew bundle` contains my go-to packages & software on macOS. You can install everything using the command `brew bundle`

Few stuff (like `yabai`) requires extra steps after installing.

### Dev tool version manager

I'm using [mise-en-place](https://mise.jdx.dev/) to get dev & runtime tooling:

- Python
- Node
- Rust
- Ruby
- Go
- Neovim
- OCaml
- Gleam
- Java
- Kotlin

## How to keep your dotfiles in Git

- [ChezMoi management tool](https://www.chezmoi.io/)
- [How to keep dotfiles in Git](https://engineeringwith.kalkayan.io/series/developer-experience/storing-dotfiles-with-git-this-is-the-way/)
