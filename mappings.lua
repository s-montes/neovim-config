return {
  -- first key is the mode
  n = {
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
    ["<leader>P"] = { '"+p', desc = "Paste from clipboard" },
    ["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle term" },
    -- ToggleTerm
    ["<leader>tp"] = {
      function() require("astronvim.utils").toggle_term_cmd "ipython" end,
      desc = "ToggleTerm ipython",
    },
    ["<leader>tr"] = {
      function() require("astronvim.utils").toggle_term_cmd("rich --pager " .. vim.api.nvim_buf_get_name(0)) end,
      desc = "ToggleTerm rich",
    },
    -- todo-comments
    ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODO elements" },
    -- Testing
    ["<leader>df"] = { '<cmd>lua require("neotest").run.run()<cr>', desc = "Run nearest test" },
    ["<leader>dF"] = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = "Run current test file" },
    ["<leader>dS"] = { '<cmd>lua require("neotest").run.stop()<cr>', desc = "Stop nearest test" },
    ["<leader>dt"] = { '<cmd>lua require("neotest").summary.toggle()<cr>', desc = "Toggle test summary" },
    ["<leader>dd"] = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = "Debug test" },
    ["<leader>ds"] = { '<cmd>lua require("neotest").output_panel.open()<cr>', desc = "Toggle test output panel" },
    ["<leader>d<cr>"] = { '<cmd>lua require("neotest").output.open({enter = true})<cr>', desc = "Open test result" },
    -- Python docstring
    ['<leader>l"'] = {
      ":lua require('neogen').generate()<CR>",
      noremap = true,
      silent = true,
      desc = "Generate docstring",
    },
    -- Telekasten
    ["<leader>z"] = { name = "Telekasten" },
    ["<leader>zz"] = { "<cmd>Telekasten panel<cr>", desc = ":tk Toggle panel" },
    ["<leader>zf"] = { "<cmd>Telekasten find_notes<cr>", desc = ":tk Find notes" },
    ["<leader>zs"] = { "<cmd>Telekasten search_notes<cr>", desc = ":tk Search notes" },
    ["<leader>zt"] = { "<cmd>Telekasten goto_today<cr>", desc = ":tk Open today's note" },
    ["<leader>zn"] = { "<cmd>Telekasten new_note<cr>", desc = ":tk Create new note" },
    ["<leader>zc"] = { "<cmd>Telekasten show_calendar<cr>", desc = ":tk Open calendar" },
    ["<leader>zi"] = { "<cmd>Telekasten insert_link<cr>", desc = ":tk Insert link" },
    ["<leader>z["] = { "<cmd>Telekasten toggle_todo<cr>", desc = ":tk Toggle TODO" },
    ["<leader>z<cr>"] = { "<cmd>Telekasten follow_link<cr>", desc = ":tk Follow link" },
    ["<leader>zw"] = { ":set wrap linebreak<cr>", desc = "Fix soft wrap" },
    -- ["<leader>"] = { name = "Other utils" },
  },
  v = {
    -- -- Other utils
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
