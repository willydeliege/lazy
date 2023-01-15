return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Lua
      require("tokyonight").setup({})
      -- Lua
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
