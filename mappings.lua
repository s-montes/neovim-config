local fix_style_tk = function()
  vim.api.nvim_set_hl(0, "tkTag", { bold = true, fg = "yellow", ctermbg = 0, bg = "black" })
  vim.api.nvim_set_hl(0, "tkHighlight", { bold = true, fg = "IndianRed", ctermbg = 0, bg = "black" })
  vim.api.nvim_set_hl(0, "tkLink", { underline = true, bold = true, fg = "SandyBrown" })
  vim.api.nvim_set_hl(0, "tkLinkAlias", { underline = true, bold = true, fg = "SandyBrown" })
  vim.api.nvim_set_hl(0, "tkHighlightedAliasedLink", { underline = true, bold = true, fg = "MediumSlateBlue" })
end

return {
  -- first key is the mode
  n = {
    ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
    ["<leader>p"] = { '"+p', desc = "Paste from clipboard" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle term" },
    -- ipython
    ["<leader>tp"] = {
      function() astronvim.toggle_term_cmd "ipython" end,
      desc = "ToggleTerm ipython",
    },
    -- Testing
    ["<leader>Dt"] = { '<cmd>lua require("neotest").summary.toggle()<cr>', desc = "Toggle test summary" },
    ["<leader>Dd"] = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = "Debug test" },
    ["<leader>Ds"] = { '<cmd>lua require("neotest").output_panel.open()<cr>', desc = "Toggle test output panel" },
    ["<leader>D<cr>"] = { '<cmd>lua require("neotest").output.open({enter = true})<cr>', desc = "Open test result" },
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
    ["<leader>zp"] = { fix_style_tk, desc = ":tk Prettify format" },
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