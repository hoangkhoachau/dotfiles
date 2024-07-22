return {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
        -- configuration goes here
        tabkey = "<Tab>",
        act_as_tab = true,
        behavior = "nested", ---@type ntab.behavior
        pairs = { ---@type ntab.pair[]
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "<", close = ">" },
        },
        exclude = {},
        smart_punctuators = {
            enabled = false,
            semicolon = {
                enabled = false,
                ft = { "cs", "c", "cpp", "java" },
            },
            escape = {
                enabled = false,
                triggers = {}, ---@type table<string, ntab.trigger>
            },
        },
    },
    config = function(_, opts) -- _ to ignore first argument (plugin object if any)
        -- Check if cmp, luasnip, and neotab are installed
        local ok_cmp, cmp = pcall(require, "cmp")
        local ok_luasnip, luasnip = pcall(require, "luasnip")
        local ok_neotab, neotab = pcall(require, "neotab")

        if ok_cmp and ok_luasnip and ok_neotab then
            -- Initialize neotab with the provided options
            neotab.setup(opts)

            local tab_mapping = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.jumpable(1) then
                    luasnip.jump(1)
                else
                    -- Safe call to neotab.tabout() with error handling
                    local ok, err = pcall(neotab.tabout)
                    if not ok then
                        print("Error in neotab.tabout: ", err)
                        fallback()
                    end
                end
            end, { "i", "s" })

            -- Augment the existing mappings
            cmp.setup {
                mapping = {
                    ["<Tab>"] = tab_mapping,
                    ["<S-Tab>"] = cmp.mapping.select_prev_item()
                }
            }
        else
            if not ok_cmp then
                vim.notify("nvim-cmp is not installed or configured correctly", vim.log.levels.ERROR)
            end
            if not ok_luasnip then
                vim.notify("LuaSnip is not installed or configured correctly", vim.log.levels.ERROR)
            end
            if not ok_neotab then
                vim.notify("neotab.nvim is not installed or configured correctly", vim.log.levels.ERROR)
            end
        end
    end
}
