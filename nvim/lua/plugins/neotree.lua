local function is_neotree_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "neo-tree" then
      return true, win
    end
  end
  return false, nil
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          visible = true,
        },
      },
      window = {
        position = "left",
        width = 35
      },
    })
  end,
  keys = {
    {
      "<leader>b",
      function()
        local open, win = is_neotree_open()
        if open then
          vim.api.nvim_win_close(win, true)
        else
          require("neo-tree.command").execute({ action = "reveal" })
          vim.cmd('Neotree reveal')
        end
      end,
      desc = "Toggle Neo-tree at current file's directory",
    },
  },
}

