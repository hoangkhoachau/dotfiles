lua <<EOF
require('plugins')
require'nvim-treesitter.configs'.setup {
    highlight ={
        enable= not (os.getenv("COLORTERM")== nil or os.getenv("COLORTERM") == ''),
        additional_vim_regex_highlighting = false,
    },
              rainbow = {
                  enable = false,
                      extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                      max_file_lines = nil, -- Do not enable for files with more than n lines, int
              },
}
-- require("nvim-dap-virtual-text").setup()
require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '<C-d>', -- reverse shift default action,
    enable_backwards = true, -- well ...
    completion = false, -- if the tabkey is used in a completion pum
    tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
        },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
    }
require("catppuccin").setup()
require("nvim-surround").setup()
require('hardline').setup {
    bufferline = true,  -- enable bufferline
        bufferline_settings = {
            exclude_terminal = false,  -- don't show terminal buffers in bufferline
                show_index = true,        -- show buffer indexes (not the actual buffer numbers) in bufferline
        },
                            theme = 'default',   -- change theme
                                sections = {         -- define sections
                                    {class = 'mode', item = require('hardline.parts.mode').get_item},
                                    {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
                                    {class = 'med', item = require('hardline.parts.filename').get_item},
                                    '%<',
                                    {class = 'med', item = '%='},
                                    {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
                                    {class = 'error', item = require('hardline.parts.lsp').get_error},
                                    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
                                    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
                                    {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60},
                                    {class = 'mode', item = require('hardline.parts.line').get_item},
                                },
}

local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/Cellar/llvm/14.0.6_1/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  },
}
EOF

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
set termguicolors
colorscheme catppuccin
if empty($COLORTERM)&&!exists("g:neovide")
    colorscheme minimalist
endif
set background=dark " for the dark version
syntax on
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:neovide_input_use_logo=v:true  " v:true on macOS
    let g:neovide_refesh_rate_idle=5
    " let g:neovide_transparency=0.0
    " let g:transparency = 0.8
    let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
    let g:neovide_remember_windows_size = v:true
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0
    let g:neovide_refresh_rate=120
endif
set guifont=JetBrainsMonoNL\ Nerd\ Font:h22
hi rainbowcol1 guifg=#3380f2

" Indention Options
set autoindent
filetype plugin on
filetype indent on 
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

" Search Options
set hlsearch
set ignorecase
set incsearch
set smartcase

" Text Rendering Options
set display+=lastline
set linebreak
syntax enable
set wrap

" User Interface Options
set laststatus=2
set ruler
set wildmenu
set tabpagemax=50
set cursorline
highlight CursorLineNR ctermfg=Yellow guifg=Yellow
set number
set relativenumber
" set noerrorbells
set visualbell
set title
" set clipboard=unnamedplus

" Code Folding Options
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Miscellaneous Options
set autoread
set autochdir
"set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set nomodeline
set splitright
set splitbelow

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'

map <Space> <Leader>
nnoremap <silent> <Leader>r <Cmd> :10split <CR>:term ./%:r <CR> i <CR>
nnoremap <F3> :NvimTreeToggle <CR>
nnoremap <F2> :25vs %:r.in <CR>
nnoremap <silent> <Leader>x <Cmd>  :!./%:r < %:r.in <CR>
nnoremap <silent> <Leader>cp <Cmd>  :w <CR> :!clang++ -std=c++20 -Wall % -o %:r<CR>
nnoremap <leader>ff <cmd>FzfLua files<cr>
nnoremap <C-t> <cmd>FzfLua files<cr>
nnoremap <leader>fg <cmd>FzfLua live_grep_native<cr>
nnoremap <leader>fh <cmd>FzfLua oldfiles<cr>
nnoremap <leader>fb <cmd>FzfLua buffers<cr>
nnoremap <leader>fc <cmd>FzfLua lgrep_curbuf<cr>

nnoremap <silent> <Leader>k <Cmd>lua require'dap'.terminate()<CR>
nnoremap <silent> <Leader>c <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader>s <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader>si <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader>so <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k

cnoremap <A-BS> <c-w>
inoremap <A-BS> <c-w>
