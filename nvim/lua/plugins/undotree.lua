return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
  },
  config = function()
    -- Optional: set undotree window options
    vim.g.undotree_WindowLayout = 2  -- side-by-side
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}

