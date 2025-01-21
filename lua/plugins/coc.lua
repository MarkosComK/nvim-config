return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    -- Set internal encoding of vim, not needed on neovim, since coc.nvim using some
    -- unicode characters in the file autoload/float.vim
    vim.opt.encoding = 'utf-8'

    -- TextEdit might fail if hidden is not set.
    vim.opt.hidden = true

    -- Some servers have issues with backup files
    vim.opt.backup = false
    vim.opt.writebackup = false

    -- Give more space for displaying messages
    vim.opt.cmdheight = 2

    -- Decrease update time
    vim.opt.updatetime = 300

    -- Always show the signcolumn
    vim.opt.signcolumn = 'yes'

    -- Configure completion popup styling
    vim.cmd[[
      " Completion popup styling
      highlight CocFloating guibg=#1e1e1e guifg=#d4d4d4
      highlight CocMenuSel guibg=#264f78 guifg=#ffffff
      
      " Use tab to trigger completion and navigate
      inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
      inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      
      " Make <CR> auto-select the first completion item
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
      
      " Define CheckBackspace function
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
    ]]

    -- Add your existing keymaps here
  end
}
