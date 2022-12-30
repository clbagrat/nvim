local g = vim.g
local o = vim.o

o.termguicolors = true

o.encoding = 'utf-8'

o.hidden = true

-- o.nobackup = true
-- o.nowritebackup = true

o.cmdheight = 2

o.updatetime = 200

-- " Don't pass messages to |ins-completion-menu|.
-- set shortmess+=c

o.signcolumn = 'number'
o.number = true

o.shiftwidth = 2
o.expandtab = true
o.swapfile = false


g.mapleader = ' '
g.maplocalleader = ' '

vim.cmd('colorscheme OceanicNext');
