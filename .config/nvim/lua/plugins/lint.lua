return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      sql = { "sqlfluff" },
    },

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "InsertLeave",
    },
      {
        pattern = "*",
        callback = function()
          require("lint").try_lint()
        end,
      })
  end,
}
