vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
        use { 'wbthomason/packer.nvim' }
        use {'kyazdani42/nvim-tree.lua', config = function() require("nvim-tree").setup() end}
        use { 'https://github.com/gauteh/vim-cppman' }
        use { 'https://github.com/terrortylor/nvim-comment' ,
    config = function()
require("nvim_comment").setup()
end}
        use { 'https://github.com/mfussenegger/nvim-dap' }
        use {'ojroques/nvim-hardline'}
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
        use { "nathom/filetype.nvim" }
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


        use { "https://github.com/p00f/nvim-ts-rainbow" ,after = {'nvim-treesitter'}}
        use { 'abecodes/tabout.nvim',wants = {'nvim-treesitter'}}
end
)

