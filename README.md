# Current dotfiles

Current dotfiles configuration. 

The configuration files are managed using [GNU Stow](https://www.gnu.org/software/stow/), which automatically setups the symlinks for all the dotfiles with the following command:

```
stow .
```

Currently holds configurations for:

- `nvim`
- `tmux`
- `zsh`
- Scripts:
    - `tmux-cht.sh`: script using `fzf` to perform `cht.sh` requests in new `tmux` windows automatically
