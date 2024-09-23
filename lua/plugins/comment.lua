return {
  'numToStr/Comment.nvim',
  opts = {
    mappings = {
      basic = false, -- Disable default basic mappings
      extra = false, -- Disable extra mappings
    },
  },
  config = function()
    require('Comment').setup {
      padding = true, -- Add space between comment and the line
      sticky = true, -- Keep cursor in the same position when commenting
      ignore = '^$', -- Ignore empty lines
      toggler = {
        line = '<A-c>', -- Toggle line comment with Alt + c
        block = '<A-c>',
      },
      opleader = {
        line = '<A-c>', -- Operator pending line comment with Alt + c
        block = '<A-c>b', -- Operator pending block comment with Alt + c + b
      },
    }
  end,
}
