local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
    function(use) 
        use 'wbthomason/packer.nvim'

        use 'mhartington/oceanic-next'

        use {
          'preservim/nerdtree',
          'Xuyuanp/nerdtree-git-plugin'
        }

        use { 
          'williamboman/mason.nvim', 
          'williamboman/mason-lspconfig.nvim', 
          'neovim/nvim-lspconfig'
        }

        use {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/nvim-cmp',
          'L3MON4D3/LuaSnip',
          'saadparwaiz1/cmp_luasnip',
          'windwp/nvim-autopairs',
        } 

        use {
          'nvim-treesitter/nvim-treesitter',
          run = function()
              local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
              ts_update()
          end,
        }


        use 'mhartington/formatter.nvim'

        use {
          'nvim-telescope/telescope.nvim', tag = '0.1.4',
          requires = { {'nvim-lua/plenary.nvim'} },
        }

        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
