# slurp.nvim
Search and replace plugin for neovim, because typing ```:%s/<search>/<replace>``` is cumbersome.

## Installation
#### Plug
```lua
Plug "Airbag65/slurp.nvim"
```


#### Packer
```lua
use({"Airbag65/slurp.nvim"})
```

If you are using another plugin manager, follow the same convention as you always do. 

## Usage
Slurp.nvim has one command: 
```vim
:Slurp
```
which just simply brings upp a modal where you type your ```search/replace```-string

### Example usage: 
```lua
vim.keymap.set('n', '<leader>sr', vim.cmd.Slurp)
```
