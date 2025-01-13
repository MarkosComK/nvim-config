return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.cmd[[
      " Use tab to select the first item
      inoremap <silent><expr> <TAB> 
        \ coc#pum#visible() ? coc#pum#confirm() :
        \ "\<Tab>"

      " Use esc to close completion menu
      inoremap <expr> <Esc> 
        \ coc#pum#visible() ? coc#pum#cancel() : 
        \ "\<Esc>"
    ]]
  end
}
