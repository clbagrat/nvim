-- Autocomplete

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

vim.g.completeopt = 'menu,menuone,noselect';

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
 
-- LSP

local lsp_flags = {
  debounce_text_changes = 150,
}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<A-e>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()
 
require('mason').setup() 

--require('mason-lspconfig').setup({
--  ensure_installed = { 'ts_ls', 'eslint', 'omnisharp', 'clangd', 'hls' },
--  automatic_installation = true
--})

require('lspconfig')['ts_ls'].setup {
  flags = lsp_flags,
  on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
  flags = lsp_flags,
  on_attach = on_attach,
  capabilities = capabilities
}


require('lspconfig')['hls'].setup {
  flags = lsp_flags,
  on_attach = on_attach,
  capabilities = capabilities
}


require('lspconfig')['eslint'].setup {
  flags = lsp_flags,
  capabilities = capabilities
}

require('lspconfig')['omnisharp'].setup {
  use_mono = true,
  flags = lsp_flags,
  capabilities = capabilities,
  on_attach = on_attach,
} 

require('lspconfig')['gdscript'].setup {
  flags = lsp_flags,
  capabilities = capabilities,
  on_attach = function (cli, buffN)  on_attach(cli, buffN); vim.o.shiftwidth = 8; vim.o.expandtab = false; end
}

-- Prettier
--require('formatter').setup({
--  filetype = {
--    typescriptreact = {
--      require('formatter.defaults.prettier')
--    },
--    typescript = {
--      require('formatter.defaults.prettier')
--    },
--    javascript = {
--      require('formatter.defaults.prettier')
--    }
--  }
--})


-- ColorCoding
require("nvim-treesitter").setup() 
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'javascript', 'typescript', 'c_sharp', 'gdscript', 'cpp', 'haskell' },
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    disable = { "gdscript" }
  }
}



-- Autopairs

local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)


-- telescope
require('telescope').setup{
  defaults = {
    path_display={truncate=3},
    file_ignore_patterns = {"node_modules"}
  }
}
