return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        cpp = { "clang-format" },
        swift = { "swiftformat" },
        markdown = { "prettier" },
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
      },
      formatters = {
        ['swiftformat'] = {
          command = 'swiftformat',
          args = { '--stdinpath', '$FILENAME' },  -- Use stdinpath to properly send buffer name
          stdin = true,
        }
      },
    })
  end,
}

