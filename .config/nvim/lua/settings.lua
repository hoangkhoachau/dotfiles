require'nvim-treesitter.configs'.setup {
    highlight ={
        enable= not (os.getenv("COLORTERM")== nil or os.getenv("COLORTERM") == ''),
        additional_vim_regex_highlighting = false,
    }
              }
require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '<C-d>', -- reverse shift default action,
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
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
require("catppuccin").setup {
    flavour = "mocha",
    color_overrides = {
        mocha = {
            -- base = "#000000",
        },
    },
    integrations = {
        nvimtree = true,
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                NvimTreeNormal = { bg = mocha.none },
            }
        end,
    },
}
require("nvim-surround").setup()
local navic = require("nvim-navic")
navic.setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  }
}
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

local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
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
    stopOnEntry = true,
    args = {},
    runInTerminal = false,
  },
}

require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
require("nvim-dap-virtual-text").setup()


--LSP
--lsp keybindings
local lsp_keybindings = function()
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

--autocomplete setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Associate a custom callback function 
-- on attaching to a clangd lsp server
local lsp = require('lspconfig')
local on_attac = function(client, bufnr)
    lsp_keybindings()
    navic.attach(client, bufnr)
end
require'lspconfig'.tsserver.setup{
    on_attach=on_attac,
    capabilities = capabilites,   
}
require'lspconfig'.clangd.setup{
    on_attach=on_attac,
    capabilities = capabilites,   
}
-- Luasnip setup
local luasnip = require 'luasnip'
require("luasnip/loaders/from_vscode").lazy_load()

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i','s'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i','s'}),
    }),
    sources = {
        {name = 'copilot'},
        {name = 'nvim_lsp'},
    { name = 'nvim_lsp_signature_help' },
        {name = 'cmp-buffer'},
        {name = 'luasnip'},
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            require("copilot_cmp.comparators").prioritize,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}

local opts = {
  highlight_hovered_item = false,
  show_guides = true,
  auto_preview = false,
  position = 'left',
  relative_width = true,
  width = 20,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "", hl = "@type" },
    Method = { icon = "", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "", hl = "@type" },
    Interface = { icon = "", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "", hl = "@string" },
    Number = { icon = "", hl = "@number" },
    Boolean = { icon = "", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "", hl = "@type" },
    Key = { icon = "", hl = "@type" },
    Null = { icon = "", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "", hl = "@type" },
    Event = { icon = "", hl = "@type" },
    Operator = { icon = "", hl = "@operator" },
    TypeParameter = { icon = "", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}
require("symbols-outline").setup(opts)
require('copilot').setup({
panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
require('copilot_cmp').setup()
require('xkbswitch').setup()
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = '*',
    command = "Copilot disable"
})
