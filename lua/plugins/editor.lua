local util = require("util")

return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>ft",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
        end,
        desc = "NeoTree (root dir)",
      },
      { "<leader>fT", "<cmd>Neotree toggle<CR>", desc = "NeoTree (cwd)" },
      { "<leader>e", "<cmd>:Neotree toggle<CR>", desc = "Explorer" },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    opts = {
      filesystem = {
        bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        cwd_target = {
          sidebar = "tab", -- sidebar is when position = left or right
          current = "window", -- current is when position = current
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
      },
      buffers = {
        bind_to_cwd = true,
        follow_current_file = true, -- This will find and focus the file in the active buffer every time
      },
    },
  },

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  -- tmux and  fish filetypes
  { "khaveesh/vim-fish-syntax", ft = { "fish" } },
  { "ericpruitt/tmux.vim", ft = { "tmux" } },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<F5>", "<cmd>UndotreeToggle<cr>", desc = "Undo file" } },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup({
            detection_methods = { "pattern", "lsp" },
            -- ignore_lsp = { "null-ls" },
            silent_chdir = false,
            show_hidden = true,
          })
          require("telescope").load_extension("projects")
        end,
        keys = {
          {
            "<leader>fp",
            function()
              require("telescope").extensions.projects.projects({})
            end,
            desc = "Find projects",
          },
        },
      },
    },
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Search in Files" },
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>ha", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>hf", "<cmd>Telescope filetypes<cr>", desc = "File Types" },
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>ho", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>hs", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>ht", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      {
        "<leader>ss",
        util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
          file_ignore_patterns = { "^.git/", "^node_modules/", "^vendor/" },
          prompt_prefix = " ",
          selection_caret = " ",
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          },
          live_grep = {
            hidden = true,
            additional_args = function(_)
              return { "--hidden" }
            end,
          },
          git_files = {
            theme = "dropdown",
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/leap.nvim",
    event = "BufReadPre",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      key_labels = { ["<leader>"] = "SPC" },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>h"] = { name = "+help" },
        ["<leader>n"] = { name = "+noice" },
        ["<leader>o"] = { name = "+open" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>T"] = { name = "+toggle" },
        ["<leader>t"] = { name = "+tasks" },
        ["<leader>tb"] = { name = "+burndown" },
        ["<leader>th"] = { name = "+history" },
        ["<leader>tG"] = { name = "+Ghistory" },
        ["<leader>tc"] = { name = "+choose" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>z"] = { name = "+zettelkasten" },
        ["<leader>zd"] = { name = "+diary" },
        ["<leader><tab>"] = { name = "+tabs" },
      })
    end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      { "<leader>xtt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo Trouble" },
      { "<leader>xT", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
    },
  },
}
