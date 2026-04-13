---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
      g = {},
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<leader>y"] = { '"+y', desc = "Yank to clipboard" },
        ["<leader>P"] = { '"+p', desc = "Paste from clipboard" },
        ["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle term" },
        ["<leader>tp"] = {
          function() require("astrocore").toggle_term_cmd "ipython" end,
          desc = "ToggleTerm ipython",
        },
        ["<leader>df"] = { '<cmd>lua require("neotest").run.run()<cr>', desc = "Run nearest test" },
        ["<leader>dF"] = {
          '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
          desc = "Run current test file",
        },
        ["<leader>dS"] = { '<cmd>lua require("neotest").run.stop()<cr>', desc = "Stop nearest test" },
        ["<leader>dt"] = { '<cmd>lua require("neotest").summary.toggle()<cr>', desc = "Toggle test summary" },
        ["<leader>dd"] = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = "Debug test" },
        ["<leader>ds"] = { '<cmd>lua require("neotest").output_panel.open()<cr>', desc = "Toggle test output panel" },
        ["<leader>d<cr>"] = { '<cmd>lua require("neotest").output.open({enter = true})<cr>', desc = "Open test result" },
        ['<leader>l"'] = {
          ":lua require('neogen').generate()<CR>",
          noremap = true,
          silent = true,
          desc = "Generate docstring",
        },
        ["<leader>z"] = { desc = "Telekasten" },
        ["<leader>zw"] = { ":set wrap linebreak<cr>", desc = "Fix soft wrap" },
      },
    },
  },
}
