-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   version = '*',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  --     'MunifTanjim/nui.nvim',
  --   },
  --   lazy = false,
  --   keys = {
  --     { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  --   },
  --   opts = {
  --     clost_if_last_window = true,
  --     filesystem = {
  --       window = {
  --         position = 'right',
  --         mappings = {
  --           ['\\'] = 'close_window',
  --         },
  --       },
  --       hijack_netrw_behavior = 'open_default',
  --       group_empty_dirs = true,
  --     },
  --   },
  -- },
  {
    {
      'stevearc/oil.nvim',
      lazy = false,
      keys = {
        { '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
      },
      opts = {
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
      },
      -- Optional dependencies
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      local ag = vim.api.nvim_create_augroup
      local au = vim.api.nvim_create_autocmd

      -- REQUIRED
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: [Add] file' })
      vim.keymap.set('n', '<leader>h', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: [H]arpoon menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: View file 1' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: View file 2' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: View file 3' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: View file 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'stevearc/aerial.nvim',
    opts = {
      layout = {
        default_direction = 'left',
        resize_to_content = false,
        preserve_equality = true,
        max_width = { 40, 0.2 },
        min_width = { 35, 0.25 },
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
