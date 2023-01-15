--Options are automatically loaded before lazy.nvim startup
--Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--Add any additional options here
--This file is automatically loaded by plugins.config
vim.g.clipboard = {
  name = "custom clipboard",
  copy = {
    ["+"] = "xsel -i --clipboard",
    ["*"] = "xsel -i --clipboard",
  },
  paste = {
    ["+"] = "xsel -o --clipboard",
    ["*"] = "xsel -o --clipboard",
  },
  cache_enabled = 1,
}
vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.opt.autowrite = true -- enable auto write

vim.opt.cmdheight = 0

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.clipboard = "unnamedplus"

vim.opt.conceallevel = 3 -- Hide * markup for bold and italic

vim.opt.confirm = true -- confirm to save changes before exiting modified buffer

vim.opt.cursorline = true -- Enable highlighting of the current line

vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.formatoptions = "jcroqlnt" -- tcqj

vim.opt.grepformat = "%f:%l:%c:%m"

vim.opt.grepprg = "rg --vimgrep"

vim.opt.guifont = "JetBrainsMono NF:h11"

vim.opt.hidden = true -- Enable modified buffers in background

vim.opt.ignorecase = true -- Ignore case

vim.opt.inccommand = "nosplit" -- preview incremental substitute

vim.opt.joinspaces = false -- No double spaces with join after a dot

vim.opt.laststatus = 0

vim.opt.list = true -- Show some invisible characters (tabs...

vim.opt.mouse = "a" -- enable mouse mode

vim.opt.number = true -- Print line number

vim.opt.pumblend = 10 -- Popup blend

vim.opt.pumheight = 10 -- Maximum number of entries in a popup

vim.opt.relativenumber = true -- Relative line numbers

vim.opt.scrolloff = 4 -- Lines of context

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

vim.opt.shiftround = true -- Round indent

vim.opt.shiftwidth = 2 -- Size of an indent

vim.opt.showmode = false -- dont show mode since we have a statusline

vim.opt.sidescrolloff = 8 -- Columns of context

vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

vim.opt.smartcase = true -- Don't ignore case with capitals

vim.opt.smartindent = true -- Insert indents automatically

vim.opt.spelllang = { "en", "fr" }

vim.opt.splitbelow = true -- Put new windows below current

vim.opt.splitright = true -- Put new windows right of current

vim.opt.tabstop = 2 -- Number of spaces tabs count for

vim.opt.termguicolors = true -- True color support

vim.opt.timeoutlen = 300

vim.opt.undofile = true

vim.opt.undolevels = 10000

vim.opt.updatetime = 200 -- save swap file and trigger CursorHold
vim.opt.swapfile = false --disable swapfile

vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.go.winminwidth = 5 -- minimum window width

vim.opt.wrap = false -- Disable line wrap

vim.opt.foldmethod = "expr"

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldlevel = 99

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"

  vim.o.shortmess = "filnxtToOFWIcC"
end

-- fix markdown indentation settings

vim.g.markdown_recommended_style = 0
