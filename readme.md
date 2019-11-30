# Terminal setup

Sets up zsh/Oh My Zsh, dotfiles, shell scripts, Node.js/npm, and global npm modules.

```shell
$ ./init.sh
```

## Where things are

After running `./init.sh`:

- Dotfiles: `~/terminal-setup/dotfiles` (symlinks in `~`)
- Shell scripts: `~/shell-scripts` (symlinks in `~/bin`)

Edit and read those files at the paths above.

## Tracking a new dotfile

1. Add the file to `dotfiles/`
2. In `scripts/createdotfiles.sh`, add the filename to the `files` array
3. Run `./scripts/createdotfiles.sh` to create a symlink for the new file in `~`
