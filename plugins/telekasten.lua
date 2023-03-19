return {
  {
    "renerocksai/telekasten.nvim",
    config = function()
      local notes_workspace = os.getenv "LOCAL_NOTES_PATH"
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
  },
}
