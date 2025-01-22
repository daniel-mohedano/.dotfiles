# dotfiles

Dotfiles configuration. 

The configuration files are managed using [GNU Stow](https://www.gnu.org/software/stow/), which automatically setups the symlinks for all the dotfiles with the following command:

```
stow .
```

Configuration using:
- `zsh`: shell
    - [`oh-my-zsh`](https://ohmyz.sh): zsh configuration framework
        - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
        - [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
        - [`zsh-vi-mode`](https://github.com/jeffreytse/zsh-vi-mode)
    - [`starship`](https://starship.rs/): shell prompt
- [`exa`](https://github.com/eza-community/eza): ls alternative
- [`tmux`](https://github.com/tmux/tmux): terminal multiplexer
    - [`tpm`](https://github.com/tmux-plugins/tpm): tmux plugin manager
