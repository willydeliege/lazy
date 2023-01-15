return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = "",
    branch = "master",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = true,
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          require("nvim-treesitter.configs").setup({
            textobjects = {
              select = {
                enable = true,
                lookahead = true,
                include_surrounding_whitespace = true,
                keymaps = {
                  -- You can use the capture groups defined in textobjects.scm
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  -- You can optionally set descriptions to the mappings (used in the desc parameter of
                  -- nvim_buf_set_keymap) which plugins like which-key display
                  -- ["iC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                },
              },
              swap = {
                enable = true,
              },
              move = {
                enable = true,
              },
              lsp_interop = {
                enable = true,
                border = "single",
              },
            },
          })
        end,
      },
      -- {
      --   "JoosepAlviste/nvim-ts-context-commentstring",
      --   config = function()
      --     require("nvim-ts-context-commentstring").setup()
      --   end,
      -- },
      {
        "m-demare/hlargs.nvim",
        config = true,
      },
    },
    event = "BufReadPre",
    ---@type TSConfig
    opts = {
      sync_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = "all",
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      if plugin.ensure_installed then
        require("util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_instaltled")
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
