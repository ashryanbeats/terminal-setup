# Dotfiles

```shell
$ ./init.sh
```

Todo:

- Add comments throughout

## Where things are

After running `./init.sh`:

- Dotfiles: `~/dotfiles/dotfiles` (symlinks in `~`)
- Shell scripts: `~/shell-scripts` (symlinks in `~/bin`)

## Tracking a new dotfile

1. Add the file to `dotfiles/`
2. In `scripts/createdotfiles.sh`, add the filename to the `files` array
3. Run `./scripts/createdotfiles.sh` to create a symlink for the new file in `~`
