-- lazy.nvim
-- Bootstrap lazy.nvim
require("config.lazy")

-- keybindings
require("config.keybindings")
-- Neovim basic setting
vim.opt.termguicolors = true
vim.cmd("let g:catppuccin_flavour = 'mocha'")
vim.cmd("colorscheme catppuccin")

if vim.fn.empty(vim.fn.getenv('COLORTERM')) == 1 and not vim.fn.exists("g:neovide") then
  vim.cmd("colorscheme minimalist")
end

vim.opt.background = "dark"
vim.cmd("syntax on")

if vim.fn.exists("g:neovide") then
  vim.g.neovide_input_use_logo = true
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_remember_windows_size = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_refresh_rate = 120
end

vim.opt.guifont = "JetBrainsMonoNL Nerd Font:h16"
vim.cmd("hi rainbowcol1 guifg=#3380f2")

-- Indentation Options
vim.opt.autoindent = true
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Search Options
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Text Rendering Options
vim.opt.display:append('lastline')
vim.opt.linebreak = true
vim.cmd("syntax enable")
vim.opt.wrap = true

-- User Interface Options
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.wildmenu = true
vim.opt.tabpagemax = 50
vim.opt.cursorline = true
vim.cmd("highlight CursorLineNR ctermfg=Yellow guifg=Yellow")
vim.cmd("highlight CursorLine ctermbg=none guibg=none")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.visualbell = true
vim.opt.title = true

-- Code Folding Options
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 3
vim.opt.foldenable = false

-- Miscellaneous Options
vim.opt.autoread = true
vim.opt.autochdir = true
vim.opt.confirm = true
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.pumheight = 10
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'preview'}


-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
--     pattern = '*',
--     command = "Copilot disable"
-- })
