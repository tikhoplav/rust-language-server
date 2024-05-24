# Dockerized rust lanugage server

> [rust-analyzer](https://github.com/rust-lang/rust-analyzer)

This is an original `rust:alpine` image with `rust-analyzer` pre-installed.

```lua
local root_dir = vim.fn.getcwd()

require('lspconfig').tsserver.setup({
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = {
    'docker', 'run', '-i', '--rm',
    '-v', root_dir .. ':' .. root_dir,
    'tikhoplav/rust-language-server'
  },
  root_dir = function(fname)
    local util = require('lspconfig').util

    return util.root_pattern('Cargo.toml')(fname)
      or util.find_git_ancestor(fname)
  end,
})
```
