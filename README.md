# Nvim configuration

This is my nvim configuration. It's a bit ugly, but I like it. It's based on the great [magic-kit](https://github.com/Olical/magic-kit) configuration. It's made almost entirely with [Fennel](https://fennel-lang.org/), a lispy flavor of Lua.

## Requirements

- `git` (for cloning the project and managing plugins)
- `Neovim 0.5+` (this is unreleased at the time of writing, you'll have to find a nightly build or compile it yourself)
- `cargo` to compile some of the dependencies

## Installation

To use this configuration just follow the following steps

```bash
# Clone the project into your Neovim configuration directory.
git clone git@github.com:tupini07/nvim-config.git ~/.config/nvim

# Perform initial sync, which will fetch all the plugins.
# Run this every time you change the plugin configuration.
~/.config/nvim/script/sync.sh
```

Once that's done, start `nvim` qnormally. You now need to do some followup configuration

```vim
" setup tree-sitter org mode config
:TSUpdate org
```

## Unlicenced

Find the full http://unlicense.org/[unlicense] in the `UNLICENSE` file, but here's a snippet.

____
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
____
