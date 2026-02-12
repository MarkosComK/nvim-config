return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",   -- loads only on insert mode → fast startup
	config = true,           -- auto calls .setup({}) with sane defaults
}
