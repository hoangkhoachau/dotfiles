return { "catppuccin/nvim", name = "catppuccin", priority = 1000, config=function()
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
end, }
