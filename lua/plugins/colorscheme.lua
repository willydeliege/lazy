return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Lua
      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg = "#000000"
          colors.bg_dark = "#000000"
        end,
      })
      -- Lua
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
