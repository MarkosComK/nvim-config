return {
  "xero/miasma.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme miasma")

    -- Definir transparência
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })  -- Fundo do editor transparente
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })  -- Janelas flutuantes transparentes
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })  -- Linha de status transparente
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })  -- Separadores de janelas transparentes
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })  -- Números de linha transparentes
  end,
}
