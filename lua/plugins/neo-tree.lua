return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- Configuração do Neo-tree
    require('neo-tree').setup {
      window = {
        width = 30, -- Ajuste a largura para o valor desejado
      },
    }

    -- Atalho para abrir/fechar o Neo-tree com Ctrl+Space
    vim.api.nvim_set_keymap('n', '<C-Space>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
