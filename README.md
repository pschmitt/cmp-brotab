# cmp-brotab

Browser tab content content completion for 
[nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

# Requirements

- [neovim](https://github.com/neovim/neovim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [BroTab](https://github.com/balta2ar/brotab)

# Installation (packer.nvim)

```lua
use {
  'pschmitt/cmp-brotab',
  requires = "hrsh7th/nvim-cmp",
}
```

# Configuration

```lua
require('cmp').setup({
  sources = {
    { name = 'brotab' }
  }
})
```

# LunarVim Configuration

```lua
lvim.plugins = {
  {
    "pschmitt/cmp-brotab"
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    setup = function()
      table.insert(lvim.builtin.cmp.sources, { name = "brotab" })
      lvim.builtin.cmp.formatting.source_names.brotab = "(BROTAB)"
    end
  },
}
```lua
