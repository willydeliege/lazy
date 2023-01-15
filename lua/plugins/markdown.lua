return {
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup({
        softener = { markdown = 1.3 },
      })
    end,
    event = "BufReadPre",
  },
  {
    "uga-rosa/translate.nvim",
    ft = "markdown",
    config = function()
      require("translate").setup({})
    end,
  },
  { "willydeliege/markdowntasks", ft = "markdown", commit = "36ed3a4cf42ba6af14ee986d5c35f0166a36756e" },
  { "preservim/tagbar", ft = "markdown" },
  {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup({
        modules = {
          bib = false,
          buffers = true,
          conceal = true,
          cursor = true,
          folds = false,
          links = true,
          lists = true,
          maps = true,
          paths = true,
          tables = true,
        },
        filetypes = { md = true, rmd = true, markdown = true },
        create_dirs = true,
        perspective = {
          priority = "root",
          fallback = "current",
          root_tell = "index.md",
          nvim_wd_heel = true,
        },
        wrap = true,
        bib = {
          default_path = nil,
          find_in_root = true,
        },
        silent = false,
        links = {
          style = "wiki",
          conceal = true,
          implicit_extension = nil,
          transform_implicit = function(input)
            if input:match("^%d%d%d%d%-%d%d%-%d%d") then
              return ("diary/" .. input)
            else
              return ("" .. input)
            end
          end,
          transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            return text
          end,
        },
        to_do = {
          symbols = { " ", "S", "X" },
          update_parents = true,
          not_started = " ",
          in_progress = "S",
          complete = "X",
        },
        tables = {
          trim_whitespace = true,
          format_on_move = true,
          auto_extend_rows = false,
          auto_extend_cols = false,
        },
        mappings = {
          MkdnEnter = { "v", "<CR>" },
          MkdnTab = false,
          MkdnSTab = false,
          MkdnNextLink = { "n", "<Tab>" },
          MkdnPrevLink = { "n", "<S-Tab>" },
          MkdnNextHeading = { "n", "))" },
          MkdnPrevHeading = { "n", "((" },
          MkdnGoBack = false,
          MkdnGoForward = false,
          MkdnFollowLink = false, -- see MkdnEnter
          MkdnDestroyLink = { "n", "<M-CR>" },
          MkdnTagSpan = { "v", "<M-CR>" },
          MkdnMoveSource = { "n", "<F2>" },
          MkdnYankAnchorLink = { "n", "ya" },
          MkdnYankFileAnchorLink = { "n", "yfa" },
          MkdnIncreaseHeading = { "n", "+" },
          MkdnDecreaseHeading = { "n", "-" },
          MkdnToggleToDo = { "n", "<c-t>" },
          MkdnNewListItem = { "i", "<CR>" },
          MkdnNewListItemBelowInsert = { "n", "o" },
          MkdnNewListItemAboveInsert = { "n", "O" },
          MkdnExtendList = false,
          MkdnUpdateNumbering = false, -- { 'n', '<leader>nn' },
          MkdnTableNextCell = { "i", "<Tab>" },
          MkdnTablePrevCell = { "i", "<S-Tab>" },
          MkdnTableNextRow = false,
          MkdnTablePrevRow = { "i", "<M-CR>" },
          MkdnTableNewRowBelow = false, --  'n', '<leader>ir' },
          MkdnTableNewRowAbove = false, --  'n', '<leader>iR' },
          MkdnTableNewColAfter = false, --  'n', '<leader>ic' },
          MkdnTableNewColBefore = false, -- { 'n', '<leader>iC' },
          MkdnFoldSection = false, -- { 'n', '<leader>f' },
          MkdnUnfoldSection = false, --{ 'n', '<leader>F' }
        },
      })
    end,
    ft = "markdown",
  },
  {
    "mickael-menu/zk-nvim",
    ft = "markdown",
    config = function()
      require("zk").setup({
        picker = "telescope",
      })
    end,
    keys = {
      { "<leader>zl", "<cmd>ZkLinks<cr>", desc = "Links" },
      { "<leader>zb", "<cmd>ZkBackLinks<cr>", desc = "Backlinks" },
      { "<leader>zn", "<cmd>ZkNotes<cr>", desc = "Notes" },
      { "<leader>zdd", "<cmd>ZkNew { dir = 'diary' }<cr>", desc = "Today" },
      { "<leader>zdy", "<cmd>ZkNew { dir = 'diary', date='Yesterday' }<cr>", desc = "Yesterday" },
      { "<leader>zdt", "<cmd>ZkNew { dir = 'diary', date='tomorrow' }<cr>", desc = "Tomorrow" },
    },
  },
  { "ellisonleao/glow.nvim", ft = "markdown" },
}
