local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<leader>s', ':NERDTreeFind<CR>')
map('n', '<leader>b', ':NERDTreeToggle<CR>')

map('t', '<Esc>', '<C-\\><C-n>')
map('n', '<leader>t', ':vert rightbelow split | :term cd %:p:h && zsh<CR>')
map('n', '<Esc>', ':noh<CR>')

map('n', '<A-w>', '<C-w>')

map('n', '<A-n><A-n>', ':set invrelativenumber <CR>')


map('n', '<leader>F', ':Format <CR>')

map('n', '<S-A-j>', '<CMD>move .+1<CR>')
map('n', '<S-A-k>', '<CMD>move .-2<CR>')
map('x', '<S-A-j>', ":move '>+1<CR>gv=gv")
map('x', '<S-A-k>', ":move '<-2<CR>gv=gv")

map('n', '<leader>j', ':cnext<CR>')
map('n', '<leader>k', ':cprev<cr>')
map('n', '<leader>o', ':copen<CR>')

map('n', '<leader>p', '"*p')
map('v', '<leader>p', '"*p')
map('n', '<leader>y', '"*y')
map('v', '<leader>y', '"*y')


local builtin = require('telescope.builtin')
  
map('n', '<A-p>', builtin.find_files, {})
map('n', '<A-f>', builtin.live_grep, {})
map('n', '<A-b>', builtin.buffers, {})
--map('n', '<leader>fh', builtin.help_tags, {})
