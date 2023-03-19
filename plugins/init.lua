return {
  {
    "renerocksai/telekasten.nvim",
    cmd = "Telekasten",
    keys = {
      ["<leader>zz"] = { "<cmd>Telekasten panel<cr>", desc = ":tk Toggle panel" },
      ["<leader>zf"] = { "<cmd>Telekasten find_notes<cr>", desc = ":tk Find notes" },
      ["<leader>zs"] = { "<cmd>Telekasten search_notes<cr>", desc = ":tk Search notes" },
      ["<leader>zt"] = { "<cmd>Telekasten goto_today<cr>", desc = ":tk Open today's note" },
      ["<leader>zn"] = { "<cmd>Telekasten new_note<cr>", desc = ":tk Create new note" },
      ["<leader>zc"] = { "<cmd>Telekasten show_calendar<cr>", desc = ":tk Open calendar" },
      ["<leader>zi"] = { "<cmd>Telekasten insert_link<cr>", desc = ":tk Insert link" },
      ["<leader>z["] = { "<cmd>Telekasten toggle_todo<cr>", desc = ":tk Toggle TODO" },
      ["<leader>z<cr>"] = { "<cmd>Telekasten follow_link<cr>", desc = ":tk Follow link" },
    },
    config = function()
      local notes_workspace = vim.fn.expand(os.getenv "LOCAL_NOTES_PATH")
      require("telekasten").setup {
        home = notes_workspace,
        uuid = "rand",
        template_new_daily = notes_workspace .. "templates/daily.md",
        template_new_note = notes_workspace .. "templates/new_note.md",
      }
    end,
  },
  {
    "renerocksai/calendar-vim",
    dependencies = { "renerocksai/telekasten.nvim" },
  },
}
