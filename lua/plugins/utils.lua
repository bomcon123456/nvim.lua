return {
  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = true,
    keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' } },
  },
  {
    'kristijanhusak/vim-carbon-now-sh',
    keys = {
      {
        '<leader>rs',
        ':CarbonNowSh<CR>',
        mode = { 'v', 'n' },
        desc = 'Take code snapshot',
      },
    },
  },
  {
    '2kabhishek/nerdy.nvim',
    cmd = 'Nerdy',
    keys = {
      { '<leader>ci', '<cmd>Nerdy<cr>', desc = 'Pick Icon' },
    },
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   cmd = {
  --     "TmuxNavigateLeft",
  --     "TmuxNavigateDown",
  --     "TmuxNavigateUp",
  --     "TmuxNavigateRight",
  --     "TmuxNavigatePrevious",
  --     "TmuxNavigatorProcessList",
  --   },
  --   keys = {
  --     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  --   },
  -- },
}
