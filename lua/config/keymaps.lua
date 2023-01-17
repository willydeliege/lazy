-- This file is automatically loaded by plugins.config
local util = require("util")
local keymap = vim.keymap.set

keymap("n", "<c-$>", "c-]")
-- better up/down
keymap("n", "j", "v:count == 0 ? 'gjzz' : 'jzz'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gkzz' : 'kzz'", { expr = true, silent = true })

-- FIXME: document all keymaps

-- -- Move to window using the <ctrl> hjkl keys
-- keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move down" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move up" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })

-- Switch buffers with <shift> hl
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', { desc = "Paste withour yanking" })
-- Easier pasting
keymap("n", "[p", ":pu!<cr>", { desc = "Paste below" })
keymap("n", "]p", ":pu<cr>", { desc = "Paste above" })

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
keymap("n", "gw", "*N")
keymap("x", "gw", "*N")

-- Center search results
keymap("n", "n", "nzz", { desc = "Search forward" })
keymap("n", "N", "Nzz", { desc = "Search backwards" })
-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- save in insert mode
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- lazy
keymap("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- navigate quickfix
keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })
keymap("n", "<leader>xn", "<cmd>cnfile<cr>", { desc = "Next Quickfix file" })
keymap("n", "<leader>xp", "<cmd>cpfile<cr>", { desc = "Previous Quickfix file" })
-- stylua: ignore start

-- toggle options
keymap("n", "<leader>Tf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
keymap("n", "<leader>Ts", function() util.toggle("spell") end, { desc = "Toggle Spelling" })
keymap("n", "<leader>Tw", function() util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
keymap("n", "<leader>Tn", function() util.toggle("relativenumber", true) util.toggle("number") end, { desc = "Toggle Line Numbers" })
keymap("n", "<leader>Td", util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
keymap("n", "<leader>Tc", function() util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
-- taskwarrior
keymap("n", "<leader>tw", function() require("util").float_term({ "taskwarrior-tui" }) end, { desc = "Taskwarrior-tui" })
-- lazygit
keymap("n", "<leader>gg", function() require("util").float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })
keymap("n", "<leader>gG", function() util.float_term({ "lazygit" }, { cwd = util.get_root() }) end, { desc = "Lazygit (root dir)" })

-- quit
keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  keymap("n", "<leader>hl", vim.show_pos, { desc = "Highlight Groups at cursor" })
end

-- floating terminal
keymap("n", "<leader>ot", function() util.float_term(nil, { cwd = util.get_root() }) end, { desc = "Terminal (root dir)" })
keymap("n", "<leader>oT", function() require("util").float_term() end, { desc = "Terminal (cwd)" })
keymap("t", "<esc><esc>", "<c-\\><c-n>", {desc = "Enter Normal Mode"})

-- windows
keymap("n", "<leader>ww", "<C-W>p", { desc = "other-window" })
keymap("n", "<leader>wd", "<C-W>c", { desc = "delete-window" })
keymap("n", "<leader>w-", "<C-W>s", { desc = "split-window-below" })
keymap("n", "<leader>w|", "<C-W>v", { desc = "split-window-right" })

-- tabs
keymap("n", "<leader><tab>l", "<cmd>tablast<CR>", { desc = "Last" })
keymap("n", "<leader><tab>f", "<cmd>tabfirst<CR>", { desc = "First" })
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "New Tab" })
keymap("n", "<leader><tab>n", "<cmd>tabnext<CR>", { desc = "Next" })
keymap("n", "<leader><tab>d", "<cmd>tabclose<CR>", { desc = "Close" })
keymap("n", "<leader><tab>p", "<cmd>tabprevious<CR>", { desc = "Previous" })

-- buffers
keymap("n", "<leader>bP", "<cmd>:BufferLinePickClose<CR>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>:e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>bp", "<cmd>:BufferLinePick<CR>", { desc = "Pick a Buffer" })
keymap("n", "<leader>'", "<cmd>:e #<cr>", { desc = "Switch to Other Buffer" })
