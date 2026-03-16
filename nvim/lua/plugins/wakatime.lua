return {
  { "wakatime/vim-wakatime", lazy = false },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Prettier for Markdown
      opts.formatters_by_ft.markdown = { "prettier" }
      opts.formatters_by_ft.markdown_inline = { "prettier" }
      opts.formatters_by_ft["markdown.mdx"] = { "prettier" }
      opts.formatters_by_ft.mdx = { "prettier" }

      opts.formatters_by_ft.ruby = { "rubyfmt" }

      return opts
    end,
  },

  {
    "iamkarasik/sonarqube.nvim",
    config = function()
      require("sonarqube").setup({})
    end,
  },
}
