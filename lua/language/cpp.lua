return {
	setup = function(bufnr)
		-- Tabs for C++
		vim.bo[bufnr].expandtab		= false
		vim.bo[bufnr].tabstop		= 4
		vim.bo[bufnr].shiftwidth	= 4
		vim.bo[bufnr].softtabstop	= 4

		-- Compile & run current file with <leader>g
		vim.keymap.set("n", "<leader>g", function()
			-- Save file first
			vim.cmd("write")

			-- Compile with g++ (C++17 standard, output to /tmp/a.out)
			-- Then run it immediately
			vim.cmd("!g++ -std=c++17 -Wall " .. vim.fn.expand("%") .. " -o /tmp/a.out && /tmp/a.out")
		end, {
			buffer = bufnr,
			desc = "Compile & run current .cpp file",
		})
	end,
}
