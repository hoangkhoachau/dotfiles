lua <<EOF
require('plugins')
require('settings')
EOF


"set guicursor=i:block
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
    let g:neovide_transparency = 0.8
    let g:neovide_refesh_rate_idle=5
    let g:neovide_remember_windows_size = v:true
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0
    let g:neovide_refresh_rate=120
endif
set guifont=JetBrainsMonoNL\ Nerd\ Font:h16
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
highlight CursorLine ctermbg=none guibg=none
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
nnoremap <F5> :SymbolsOutline <CR>
nnoremap <F4> :UndotreeToggle <CR>
nnoremap <F3> :NvimTreeToggle <CR>
nnoremap <F2> :25vs %:r.in <CR>
"nnoremap <silent> <Leader>x <Cmd>  :!./%:r < %:r.in <CR>"
nnoremap <silent> <Leader>cp <Cmd>  :w <CR> :!clang++ -std=c++20 -Wall % -o %:r<CR>
nnoremap <leader>ff <cmd>FzfLua files<cr>
nnoremap <C-t> <cmd>FzfLua files<cr>
nnoremap <leader>fg <cmd>FzfLua live_grep_native<cr>
nnoremap <leader>fh <cmd>FzfLua oldfiles<cr>
nnoremap <leader>fb <cmd>FzfLua buffers<cr>
nnoremap <leader>fc <cmd>FzfLua lgrep_curbuf<cr>
nnoremap <leader>fs <cmd>FzfLua lsp_document_symbols<cr>
nnoremap <leader>fd <cmd>FzfLua diagnostics_document<cr>
autocmd FileType c,cpp nnoremap  <silent> <buffer> <Leader>x <Cmd>  :!./%:r < %:r.in <CR>
autocmd FileType javascript,typescript nnoremap <silent> <buffer> <Leader>x <Cmd>  :!ts-node %:t < %:r.in <CR>

nnoremap <silent> <Leader>dq <Cmd>lua require'dap'.terminate()<CR>
nnoremap <silent> <Leader>dc <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader>so <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader>sb <Cmd>lua require'dap'.step_back()<CR>
nnoremap <silent> <Leader>si <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader>su <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>

cnoremap <A-BS> <c-w>
inoremap <A-BS> <c-w>
cnoremap <C-BS> <C-o>dd
inoremap <C-BS> <C-o>dd

nnoremap <silent> <A-h> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>
nnoremap <silent> <A-j> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>
nnoremap <silent> <A-k> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>
nnoremap <silent> <A-l> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>
nnoremap <silent> <A-\> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>
nnoremap <silent> <A-Space> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>
nnoremap <silent> <C-w>% <C-w>v
nnoremap <silent> <C-w>" <C-w>s
nnoremap <silent> <C-w>x :q<cr>

