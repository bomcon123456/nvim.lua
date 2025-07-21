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
}
