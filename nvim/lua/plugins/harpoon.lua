return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",  -- THIS is critical
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    })

    local list = harpoon:list()

    vim.keymap.set("n", "<leader>ha", function() list:add() end, { desc = "Harpoon Add File" })
    vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(list) end, { desc = "Harpoon Menu" })
    vim.keymap.set("n", "<leader>h1", function() list:select(1) end, { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<leader>h2", function() list:select(2) end, { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<leader>h3", function() list:select(3) end, { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<leader>h4", function() list:select(4) end, { desc = "Harpoon File 4" })
  end,
}

