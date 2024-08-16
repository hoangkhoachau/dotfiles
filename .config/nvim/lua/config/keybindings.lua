-- Key Mappings
vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>r', ':10split <CR>:term ./%:r<CR>i<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F4>', '<cmd>Outline<CR>', { noremap = true, silent = true })
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
local toggleInlay = function()
                local current_value = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
                vim.lsp.inlay_hint.enable(not current_value, { bufnr = 0 })
            end
lsp_keybindings = function()
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = "Previous Diagnostic"})
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = "Next Diagnostic"})
  vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, {desc = "Go to declaration"})
  vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, {desc = "Go to definition"})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = "Show Info"})
  vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, {desc = "Show references"})
  vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, {desc = "Go to implementation"})
  vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, {desc = "Show Code Actions"})
  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, {desc = "Show Diagnostic"})
  vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, { desc = "Rename" })
  vim.keymap.set('n', '<Leader>h', toggleInlay, { desc = "Toggle Inlay hint" })
end

--xcode build
vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
