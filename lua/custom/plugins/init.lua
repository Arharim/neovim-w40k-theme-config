-- ---- Imperium Gothic rice ----
-- Custom plugins. Removed with de-foreignization: wakatime (telemetry),
-- copilot.lua, claude-code.nvim, lsp-grammarly, img-clip (foreign path),
-- cyberdream/synthwave84 (unused themes), Ionide-vim (F#).

return {
  -- Git прямо в nvim (ThePrimeagen-стиль)
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G' },
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = '[G]it [S]tatus (fugitive)' },
      { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = '[G]it [D]iff split' },
      { '<leader>gl', '<cmd>Git log<cr>', desc = '[G]it [L]og' },
    },
  },

  -- Маскировка секретов в .env и подобных файлах
  {
    'laytan/cloak.nvim',
    opts = {
      enabled = true,
      cloak_character = '✱',
      highlight_group = 'Comment',
      patterns = {
        { file_pattern = { '.env*', '*.env', '*.secrets*' }, cloak_pattern = '=.+' },
      },
    },
  },

  -- Дождь из кода: <leader>ca (сигнатурный прикол ThePrimeagen)
  { 'eandrju/cellular-automaton.nvim', lazy = true },

  -- File explorer: oil.nvim
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      local oil = require 'oil'
      oil.setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-l>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', oil.open, { desc = 'Open parent directory with oil' })
      vim.keymap.set('n', '<leader>o', oil.toggle_float)
    end,
  },

  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {}
    end,
  },

  'mbbill/undotree',
  'lambdalisue/suda.vim',

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  { -- Автодополнение (blink.cmp, без Copilot)
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      keymap = { preset = 'enter' },
      appearance = { nerd_font_variant = 'mono' },
      completion = {
        documentation = {
          auto_show = true,
          window = { border = 'single' },
        },
        menu = {
          border = 'single',
          draw = {
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
          },
        },
      },
      signature = {
        enabled = true,
        window = { border = 'single' },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require 'alpha.themes.startify'
      startify.file_icons.provider = 'devicons'
      require('alpha').setup(startify.config)
    end,
  },
}
