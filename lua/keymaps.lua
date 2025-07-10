-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Custom keymap ]]
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- vim.keymap.set('n', '<Left>', function()
--   require('origami').h()
-- end)
-- vim.keymap.set('n', '<Right>', function()
--   require('origami').l()
-- end)

-- map("n", "<leader>e", vim.cmd.Ex, { desc = "Open ex" })
map('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace [w]ord on cursor' })
map('n', '<C-f>', '<cmd>silent !tmux neww t<CR>', { desc = 'Open new tmux session' })
map('n', '<leader>F', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Open new tmux' })

-- move line
map('x', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move line up' })
map('x', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move line down' })

-- yank and paste
map('x', '<leader>p', [["_dP]], { desc = 'Paste without remove clipboard' })
map('x', '<leader>y', [["_P]], { desc = 'Yank to clipboard' })
map('n', '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
map('n', '<leader>Y', [["+Y]], { desc = 'Yank til end system clipboard' })
map('v', '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
map('n', '<leader>d', [["_d]], { desc = 'Delete without yank' })
map('v', '<leader>d', [["_d]], { desc = 'Delete without yank' })

-- line moving
-- map("n", "J", "mzJ`z`", { desc = "Connect line below" })
map('n', '<C-d>', '<C-d>zz', { desc = 'Move half-up' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Move half-down' })
map('n', 'n', 'nzzzv', { desc = 'Next find' })
map('n', 'N', 'Nzzzv', { desc = 'Prev find' })

-- UI
map('n', '<leader>un', '<cmd>Telescope notify<CR>', { desc = 'RsyncRepo: Upload' })

-- utils
map('n', '<leader>ru', '<cmd>!~/scripts/rsync_repo.py upload<CR>', { desc = 'RsyncRepo: Upload' })
map('n', '<leader>rd', '<cmd>!~/scripts/rsync_repo.py download<CR>', { desc = 'RsyncRepo: Download' })
map('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next in quick fix' })
map('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Prev in quick fix' })
map('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next in location' })
map('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Prev in location' })
map('n', '<leader>X', '<cmd>!chmod +x %<CR>', { silent = true })

map('n', '<leader>bu', vim.cmd.UndotreeToggle, { desc = 'Undotree toggle' })
map('n', '<leader>gs', vim.cmd.Git, { desc = 'Git toggle' })
-- map('n', '<leader>gg', vim.cmd.LazyGit, { desc = 'LazyGit toggle' })

-- cwd problem
-- Store the original working directory when Neovim starts
local original_cwd = vim.fn.getcwd()

-- Function to set CWD to the LSP root of the current buffer
local function set_cwd_to_lsp_root()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients { bufnr = bufnr }
  if #clients == 0 then
    print 'No active LSP clients for the current buffer.'
    return
  end
  local lsp_root = clients[1].config.root_dir
  if lsp_root and vim.fn.isdirectory(lsp_root) == 1 then
    vim.api.nvim_set_current_dir(lsp_root)
    print('Changed working directory to LSP root: ' .. lsp_root)
  else
    print 'Invalid LSP root directory.'
  end
end

-- Function to reset CWD to the original directory
local function reset_cwd_to_original()
  vim.api.nvim_set_current_dir(original_cwd)
  print('Reset working directory to original: ' .. original_cwd)
end

-- Create user commands
vim.api.nvim_create_user_command('SetCwdToLspRoot', set_cwd_to_lsp_root, {})
vim.api.nvim_create_user_command('ResetCwdToOriginal', reset_cwd_to_original, {})

-- Key mappings
map('n', '<leader>bs', ':SetCwdToLspRoot<CR>', { desc = 'Set CWD to LSP root' })
map('n', '<leader>bS', ':ResetCwdToOriginal<CR>', { desc = 'Reset CWD to original' })
