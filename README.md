# Dotfiles

These are the dotfiles @nick-ulle uses with Arch Linux on his Asus Zenbook
UX303 and Asus Zenbook Duo UX8406.

## Usage

Requirements:

* [GNU Stow](https://www.gnu.org/software/stow/)

To install:
```bash
git clone https://github.com/nick-ulle/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow */
```

To reinstall (after edits):
```bash
cd ~/.dotfiles
stow --restow */
```

To uninstall:
```bash
cd ~/.dotfiles
stow --delete */
```
