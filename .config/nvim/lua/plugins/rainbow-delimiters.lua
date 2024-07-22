return {'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    lazy=true,
    dependencies = {"https://github.com/nvim-treesitter/nvim-treesitter"},
config = function()
	require('rainbow-delimiters.setup').setup()
end
}

