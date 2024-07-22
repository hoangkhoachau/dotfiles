-- Key Mappings
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Leader>r', ':10split <CR>:term ./%:r<CR>i<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F4>', ':SymbolsOutline<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', ":lua require('undotree').toggle()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F2>', ':25vs %:r.in<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cp', ':w<CR> :!clang++ -std=c++20 -Wall % -o %:r<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>FzfLua files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>FzfLua files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>FzfLua live_grep_native<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>FzfLua oldfiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>FzfLua lgrep_curbuf<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>FzfLua diagnostics_document<CR>', { noremap = true, silent = true })

--LSP
--lsp keybindings
lsp_keybindings = function()
    vim.api.nvim_set_keymap('n', '[d', [[:lua vim.diagnostic.goto_prev()<cr>]], {})
    vim.api.nvim_set_keymap('n', ']d', [[:lua vim.diagnostic.goto_next()<cr>]], {})
    vim.api.nvim_set_keymap('n','<Leader>gD',[[:lua vim.lsp.buf.declaration()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gd',[[:lua vim.lsp.buf.definition()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>K',[[:lua vim.lsp.buf.hover()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gr',[[:lua vim.lsp.buf.references()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gs',[[:lua vim.lsp.buf.signature_help()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gi',[[:lua vim.lsp.buf.implementation()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gt',[[:lua vim.lsp.buf.type_definition()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gw',[[:lua vim.lsp.buf.document_symbol()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>gW',[[:lua vim.lsp.buf.workspace_symbol()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>ca',[[:lua vim.lsp.buf.code_action()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>e',[[:lua vim.diagnostic.open_float()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>rn',[[:lua vim.lsp.buf.rename()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>=',[[:lua vim.lsp.buf.format()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>ic',[[:lua vim.lsp.buf.incoming_calls()<cr>]],{})
    vim.api.nvim_set_keymap('n','<Leader>oc',[[:lua vim.lsp.buf.outgoing_calls()<cr>]],{})
end


