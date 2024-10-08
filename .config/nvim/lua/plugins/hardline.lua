return {
        'ojroques/nvim-hardline',
    config = function()
        navic = require("nvim-navic")
        local function get_loc()
  if not navic.is_available() then
    return ''
  end
  return navic.get_location()
end
            require('hardline').setup {
    bufferline = false,  -- enable bufferline
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
                                    {class = 'med', item = get_loc},
                                    {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
                                    {class = 'error', item = require('hardline.parts.lsp').get_error},
                                    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
                                    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
                                    {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60},
                                    {class = 'mode', item = require('hardline.parts.line').get_item},
                                },
}
    end,
    afters = { -- These are optional
             "neovim/nvim-lspconfig"
    },
}

