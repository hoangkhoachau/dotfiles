vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }
    use 'https://github.com/tpope/vim-unimpaired'
    use {'kyazdani42/nvim-tree.lua', config = function() require("nvim-tree").setup() end}
    use { 'https://github.com/hrsh7th/cmp-buffer' }
    use 'neovim/nvim-lspconfig'
    use 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help'
    use 'https://github.com/hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp' 
    use 'https://github.com/L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use {
  "zbirenbaum/copilot.lua",
}
use {
  "zbirenbaum/copilot-cmp",
}
    use 'rafamadriz/friendly-snippets'
    use 'https://github.com/mfussenegger/nvim-dap'
    use { "nvim-neotest/nvim-nio" }
    use { "alexghergh/nvim-tmux-navigation" }
    use 'theHamsta/nvim-dap-virtual-text'
use { "rcarriga/nvim-dap-ui" }
    use { 'https://github.com/terrortylor/nvim-comment' ,
    config = function()
        require("nvim_comment").setup()
    end}
    use {'ojroques/nvim-hardline'}
    use 'https://github.com/SmiteshP/nvim-navic'
    use 'https://github.com/simrat39/symbols-outline.nvim'
    use 'mbbill/undotree'
    use { 'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
}
use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})   
use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,event="BufWinEnter",
}
use { "catppuccin/nvim", as = "catppuccin" }
use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
} 
use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) 

    end
}
use 'ivanesmantovich/xkbswitch.nvim'
use 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim'
use {
    'abecodes/tabout.nvim',
    wants = {'nvim-treesitter'}, -- or require if not used so far
    --after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
}
end
)
