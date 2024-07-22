-- Key Mappings
vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>r', ':10split <CR>:term ./%:r<CR>i<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F4>', ':SymbolsOutline<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', ":lua require('undotree').toggle()<cr>", { noremap = true, silent = true })
vim.keymap.set('n', '<F2>', ':25vs %:r.in<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>cp', ':w<CR> :!clang++ -std=c++20 -Wall % -o %:r<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', '<cmd>FzfLua files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep_native<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua oldfiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua lgrep_curbuf<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fd', '<cmd>FzfLua diagnostics_document<CR>', { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>=", function()
  local conform = require("conform")
  conform.format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })

-- LSP Keybindings
lsp_keybindings = function()
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
  vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, {})
  vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<Leader>K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, {})
  vim.keymap.set('n', '<Leader>gs', vim.lsp.buf.signature_help, {})
  vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<Leader>gt', vim.lsp.buf.type_definition, {})
  vim.keymap.set('n', '<Leader>gw', vim.lsp.buf.document_symbol, {})
  vim.keymap.set('n', '<Leader>gW', vim.lsp.buf.workspace_symbol, {})
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, {})
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<Leader>ic', vim.lsp.buf.incoming_calls, {})
  vim.keymap.set('n', '<Leader>oc', vim.lsp.buf.outgoing_calls, {})
end
