local fn = vim.fn

-- Install packer if it is not installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function()
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'gruvbox-community/gruvbox'
    use 'folke/tokyonight.nvim'

    -- utilities
    use 'nvim-lua/plenary.nvim'

    -- telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- A cool statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- cmp plugins
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp") -- the completion plugin

    -- LSP settings
    use("onsails/lspkind-nvim")
    use("neovim/nvim-lspconfig")
    use("nvim-lua/lsp_extensions.nvim")
    use({
        "nvimdev/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function()
            require('lspsaga').setup({})
        end,
    })
    use("simrat39/symbols-outline.nvim")

    -- snippets
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    -- use({
    --     "L3MON4D3/LuaSnip",
    --     -- follow latest release.
    --     tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --     -- install jsregexp (optional!:).
    --     run = "make install_jsregexp"
    -- })
    use("rafamadriz/friendly-snippets")

    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'norcalli/nvim-colorizer.lua'

    -- ts-autotag requires treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    -- Autoenclosing tags
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'akinsho/nvim-bufferline.lua'

    -- markdown-preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
