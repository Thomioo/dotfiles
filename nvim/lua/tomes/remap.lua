vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>s", vim.cmd.w)
vim.keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", vim.cmd.wq)


-- Duplicate line down (Shift + J)
vim.keymap.set("n", "J", "mz:copy .-1<CR>`z", { noremap = true, silent = true })

-- Duplicate line up (Shift + K)
vim.keymap.set("n", "K", "mz:copy .-1<CR>k`z<C-E>", { noremap = true, silent = true })

-- Shift+Tab in insert mode: unindent and stay in insert mode
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })

-- NORMAL MODE
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })     -- indent line
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })   -- unindent line

-- VISUAL MODE
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })    -- indent selection and reselect
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })  -- unindent selection and reselect


-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- NORMAL mode: move current line up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- VISUAL mode: move selected lines up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files({ hidden = true })
end, { desc = "Find files (including hidden)" })

vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, { desc = "Live grep" })
