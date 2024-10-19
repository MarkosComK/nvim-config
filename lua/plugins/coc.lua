return {
  'neoclide/coc.nvim',
  branch = 'release', -- Use the latest stable release
  config = function()
    -- Configurações do Coc.nvim
    vim.cmd [[
      " Confirma a seleção ao pressionar Enter
      inoremap <silent> <expr> <CR> pumvisible() ? coc#pum#confirm() : "<C-g>u<CR>"
      
      " Configura o botão de confirmação
      let g:coc_confirm_key = '<CR>'
    ]]
end,
}
