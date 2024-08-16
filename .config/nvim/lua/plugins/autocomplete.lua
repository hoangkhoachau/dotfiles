return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            -- nvim-cmp setup
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            cmp.setup {
                snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
                mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- no not select first item
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
                sources = {
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
                window = {
                    completion = cmp.config.window.bordered({
                    border = 'none',
                    winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None',
                    }),
                    documentation = cmp.config.window.bordered({
                    border = 'none',
                    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
                    max_width = 5,
                    }),
                },            
                formatting = {
                    fields = {'menu', 'abbr', 'kind'},
                    format = require('lspkind').cmp_format({
                        maxwidth = 30,
                        ellipsis_char = "...",
                    }),
                },
                completion = {
                },
                experimental = {
                    ghost_text = true,
                },
            }


        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
            { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
            { name = 'path' }
            }, {
            { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

	    --autocomplete setup
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


        end,
        dependencies = {
            "zbirenbaum/copilot-cmp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            'https://github.com/hrsh7th/cmp-buffer',
            'onsails/lspkind.nvim', -- vs-code like pictograms
            'https://github.com/hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help',
        },
        event = {"CmdlineEnter","InsertEnter"},
    },
    {
    "L3MON4D3/LuaSnip", -- snippet completions
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")

        local lsloader = require("luasnip.loaders.from_lua")

        require("luasnip.loaders.from_vscode").lazy_load()
        lsloader.load({ paths = "~/.config/nvim/snippets" })

        local types = require("luasnip.util.types")

        ls.config.set_config({
            -- Keep last snippet to jump around
            history = true,

            -- Enable dynamic snippets
            updateevents = "TextChanged,TextChangedI",
            -- For cleaning up snippets whose text was deleted
            delete_check_events = "TextChanged",

            enable_autosnippets = true,

            ext_opts = {
                [types.choiceNode] = { active = { virt_text = { { "●", "Operator" } } } },
            },
        })

        -- Extend changelog with debchangelog
        ls.filetype_extend("changelog", { "debchangelog" })

        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set("i", "<c-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)
    end,
}
}
