return {
	"sainnhe/gruvbox-material",
	lazy = false,          -- load immediately
	priority = 1000,       -- highest priority
	config = function()
		-- Setup options (transparent & beautiful)
		vim.g.gruvbox_material_background = "hard"      -- hard / medium / soft
		vim.g.gruvbox_material_foreground = "material"  -- material / mix / original
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_transparent_background = 2  -- 0=none, 1=normal only, 2=full (including statusline, floats...)
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
		vim.g.gruvbox_material_current_word = "underline"
		vim.g.gruvbox_material_ui_contrast = "high"     -- better contrast for statusline etc.

		-- Load the colorscheme
		vim.cmd.colorscheme("gruvbox-material")

		-- Force full transparency overrides (very important for full effect)
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				local hl_groups = {
					"Normal", "NormalFloat", "NormalNC", "SignColumn", "FoldColumn",
					"VertSplit", "WinSeparator", "EndOfBuffer", "StatusLine", "StatusLineNC",
					"TabLine", "TabLineFill", "TabLineSel", "FloatBorder", "Pmenu",
					"NeoTreeNormal", "NeoTreeNormalNC", "BufferCurrent", "BufferVisible",
					"BufferInactive", "BufferTabpages",
				}
				for _, name in ipairs(hl_groups) do
					vim.api.nvim_set_hl(0, name, { bg = "NONE" })
				end
			end,
		})
	end,
}
