# Matt's dotfiles

## Stow packages

Most config is managed using [GNU Stow](https://www.gnu.org/software/stow/). Once you have installed Stow (avaialble in most distros' package managers), you can use this repo as follows:

1. Clone this repo to `~/dotfiles/`.
1. Change your shell's working directory to `~/dotfiles/`.
1. Run `stow <package name>`, where <package name> is the name of one of the directories at the root of this repo.

Stow will create symlinks to the files and/or directories in the package directory from the same place relative to `~/`. For example, because the `./tmux/` directory contains `.tmux.conf`, `stow tmux` will result in a symlink from `~/.tmux.conf` to `~/dotfiles/tmux/.tmux.conf`. Similarly, `stow wezterm` will result in a symlink from `~/.config/wezterm/` to `~/dotfiles/wezterm/.config/wezterm/`.

