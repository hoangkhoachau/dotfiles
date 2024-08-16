return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        -- From kickstart.nvim
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'bash',
                    'c',
                    'css',
                    'devicetree',
                    'dockerfile',
                    'git_config',
                    'git_rebase',
                    'gitcommit',
                    'gitignore',
                    'html',
                    'json',
                    'jsonc',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'python',
                    'query',
                    'rust',
                    'toml',
                    'vim',
                    'vimdoc',
                },
                auto_install = true,
                    highlight ={
        enable= not (os.getenv("COLORTERM")== nil or os.getenv("COLORTERM") == ''),
        additional_vim_regex_highlighting = false,
    },
                    indent = { enable = true , disable = {'swift', 'text'} },
            })
        end, 0)
    end,
}
