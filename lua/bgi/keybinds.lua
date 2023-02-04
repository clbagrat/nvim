local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>s', ':NERDTreeFind<CR>')
map('n', '<leader>b', ':NERDTreeToggle<CR>')

map('n', '<Esc>', '<C-\\><C-n>')
map('n', '<Esc>', ':noh<CR>')

map('n', '<A-p>', ':FZF<CR>')
map('n', '<A-f>', ':Ag<CR>')

map('n', '<A-w>', '<C-w>')

map('n', '<A-n><A-n>', ':set invrelativenumber <CR>')


map('n', '<leader>F', ':Format <CR>')

map('n', '<A-j>', '<CMD>move .+1<CR>')
map('n', '<A-k>', '<CMD>move .-2<CR>')
map('x', '<A-j>', ":move '>+1<CR>gv=gv")
map('x', '<A-k>', ":move '<-2<CR>gv=gv")

map('n', '<leader>p', '"*p')
map('v', '<leader>p', '"*p')
map('n', '<leader>y', '"*y')
map('v', '<leader>y', '"*y')


  
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
