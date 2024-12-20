return {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Basic setup for mason
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "jdtls" }
      })

      -- Setup Java
      require("java").setup({
        jdk = { auto_install = true },
        jdtls = { auto_install = true },
        dap = { auto_install = true },
      })

      -- Tmux-aware keymaps for Java
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          -- Run Java file
          vim.keymap.set("n", "<leader>jr", function()
            local file = vim.fn.expand("%:p")
            vim.fn.system('tmux split-window -v -p 30')
            vim.fn.system(string.format('tmux send-keys "java %s" C-m', file))
          end, { buffer = true, desc = "Run Java file" })

          -- Compile Java file
          vim.keymap.set("n", "<leader>jc", function()
            local file = vim.fn.expand("%:p")
            vim.fn.system('tmux split-window -v -p 30')
            vim.fn.system(string.format('tmux send-keys "javac %s" C-m', file))
          end, { buffer = true, desc = "Compile Java file" })

          -- Run tests
          vim.keymap.set("n", "<leader>jt", function()
            vim.fn.system('tmux split-window -h -p 40')
            vim.fn.system('tmux send-keys "mvn test" C-m')
          end, { buffer = true, desc = "Run Java tests" })

          -- Quick terminal access
          vim.keymap.set("n", "<leader>tt", function()
            vim.fn.system('tmux split-window -v -p 30')
          end, { buffer = true, desc = "Toggle terminal" })
        end
      })
    end,
}
