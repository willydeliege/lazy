return {

  -- tokyonight
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        colors = {
          bg = "#000000",
        },
      })
      vim.cmd([[colorscheme dracula]])
    end,
  },
}
