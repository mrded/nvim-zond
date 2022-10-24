# nvim-zond

A nvim plugin which searches a file and runs a command on it

### Use case
Find and run a test in a split.

<img width="574" alt="image" src="https://user-images.githubusercontent.com/347098/197293449-01b6ffb0-e41c-4152-bec6-64699476d13b.png">

```viml
nnoremap <C-t> <cmd>lua require('zond').find_and_run({ title = 'Run a test', filter = '.spec.ts$', cmd = 'vsplit term://npx jest %s' })<cr>
```

### Required dependencies

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) is required.

### Installation

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'mrded/nvim-zond'
```

Using [dein](https://github.com/Shougo/dein.vim)

```viml
call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.0' })
call dein#add('mrded/nvim-zond')
```
Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'mrded/nvim-zond',
  requires = { {'nvim-telescope/telescope.nvim', tag = '0.1.0'} }
}
```

## Usage

```lua
require('zond').find_and_run({
  title = 'Run a test',               -- (optional) a modal title.
  filter = '.spec.ts$',               -- (optional) a regex filter for the file search.
  cmd = 'vsplit term://npx jest %s'   -- a command to be run. %s will be replaced with a file path.
})
```
