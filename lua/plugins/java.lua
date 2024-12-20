return {
	{
	"nvim-java/nvim-java",
	dependencies = {
	  "nvim-treesitter/nvim-treesitter",
	  "mfussenegger/nvim-dap",
	  "rcarriga/nvim-dap-ui",
	  "williamboman/mason.nvim",
	},
	config = function()
	  local java = require("java")
	  java.setup({
		jdk = {
		  auto_discover = true,
		},
		jdtls = {
		  settings = {
			java = {
			  configuration = {
				updateBuildConfiguration = "automatic",
			  },
			  maven = {
				downloadSources = true,
			  },
			  implementationsCodeLens = {
				enabled = true,
			  },
			  referencesCodeLens = {
				enabled = true,
			  },
			  format = {
				enabled = true,
				settings = {
				  profile = "GoogleStyle",
				},
			  },
			},
		  },
		},
	  })
	end,
	},
	{
	"mfussenegger/nvim-dap",
	config = function()
	  local dap = require("dap")
	  dap.configurations.java = {
		{
		  type = "java",
		  request = "attach",
		  name = "Debug (Attach) - Remote",
		  hostName = "127.0.0.1",
		  port = 5005,
		},
	  }
	end,
	},
}
