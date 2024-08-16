return {
    'neovim/nvim-lspconfig',
     event = { "BufReadPre", "BufNewFile" },
    config = function()
-- Associate a custom callback function 
-- on attaching to a clangd lsp server
local capabilites = vim.lsp.protocol.make_client_capabilities()
capabilites.textDocument.completion.completionItem.snippetSupport = true
capabilites.workspace.didChangeWatchedFiles.dynamicRegistration = true
local lsp = require('lspconfig')
local on_attac = function(client, bufnr)
    lsp_keybindings()
    navic.attach(client, bufnr)
end
lsp.tsserver.setup{
    on_attach=on_attac,
    capabilities = capabilites,   
}
lsp.clangd.setup{
    on_attach=on_attac,
    capabilities = capabilites,   
}
lsp.pyright.setup{
    on_attach=on_attac,
    capabilities = capabilites,   
}
lsp.sourcekit.setup{
    on_attach=on_attac,
    capabilities = capabilites,
}
    end
}
