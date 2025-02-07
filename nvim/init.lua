require("sgwizdak.core.options")
require("sgwizdak.core.keymaps")
require("sgwizdak.core.colorscheme")
vim.cmd('source ~/.config/nvim/vim/halcyon1.vim')
vim.cmd('source ~/.config/nvim/vim/halcyon2.vim')
require("sgwizdak.core.lazy")


-- move the following into some sort of post-plugin setup file

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
 dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
        '/Users/sgwizdak/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb',
        '/Users/sgwizdak/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib')
    },
})

-- fn f8 will load tagbar 
vim.api.nvim_set_keymap('n', '<F8>', ":TagbarToggle<CR>", { noremap = true, silent = true });

-- trouble keymaps
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- comments.lua
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment

-- <leader>fc,fs,ff -> telescope find 
--
vim.api.nvim_set_keymap('n', '<leader>hw', ":HopWord<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>hn', ":HopNodes<CR>", { noremap = true, silent = true });


