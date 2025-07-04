require("tomes.remap")

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Track if we're navigating search
local search_active = false

-- Start listening for keys after search
vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "[/?]",
  callback = function()
    search_active = true
    vim.on_key(function(key)
      if key ~= "n" and key ~= "N" and key ~= "<CR>" then
        vim.schedule(function()
          vim.cmd("nohlsearch")
        end)
        vim.on_key(nil) -- stop listening
        search_active = false
      end
    end, vim.api.nvim_get_current_buf())
  end,
})

--vim.opt.clipboard = "unnamedplus"

-- Remap Space to do nothing (or just clear search)
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })


vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.shiftwidth = 4    -- Number of spaces for each indentation
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4   -- Number of spaces that a <Tab> counts for while performing editing ops

vim.opt.relativenumber = true
