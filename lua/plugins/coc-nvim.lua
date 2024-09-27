return {
  'neoclide/coc.nvim',
  branch = 'release', -- Use the latest stable release
  config = function()
    -- Coc.nvim configuration (optional)
    vim.cmd [[
                " Use <Tab> and <S-Tab> to navigate through popup menu
                inoremap <silent><expr> <TAB> coc#pum#visible() ? "\<C-n>" : "\<Tab>"
                inoremap <silent><expr> <S-TAB> coc#pum#visible() ? "\<C-p>" : "\<S-Tab>"
                " Use <CR> to confirm completion
                inoremap <silent> <CR> coc#pum#visible() ? coc#_select_confirm() : "<C-g>u\<CR>"
            ]]
  end,
}
