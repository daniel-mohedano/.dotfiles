local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("i", "kj", "<esc>", { desc = "Exit insert mode" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- save file
-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- diagnostics
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- windows
-- map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- others
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("x", "p", '"_dP', { desc = "Hold onto yanked content when pasting in visual mode" })

-- PLUGINS --
---@param plugin string
local function is_available(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end
-- TELESCOPE --
if is_available("telescope.nvim") then
	local builtin = require("telescope.builtin")
	map("n", "<leader>sf", builtin.find_files, { desc = "Telescope - Find files" })
	map("n", "<leader>sg", builtin.git_files, { desc = "Telescope - Find git files" })
	map("n", "<leader>ss", builtin.live_grep, { desc = "Telescope - Find string" })
	map("n", "<leader>sh", builtin.help_tags, { desc = "Telescope - Help tags" })
	map("n", "<leader>/", function()
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "Fuzzily search in current buffer" })
end
-- UNDOTREE --
if is_available("undotree") then
	map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree - Toggle" })
end
-- VIMFUGITIVE --
if is_available("vim-fugitive") then
	map("n", "<leader>gs", "<cmd>above Git<cr>", { desc = "VimFugitive - Git" })
	map("n", "<leader>p", function()
		vim.cmd.Git("push")
	end, { desc = "VimFugitive - Push" })
	map("n", "<leader>P", function()
		vim.cmd.Git("pull --rebase")
	end, { desc = "VimFugitive - Pull (rebase)" })
	map("n", "<leader>t", "<cmd>Git push -u origin<cr>", { desc = "VimFugitive - Set branch to push" })
end

map("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Project view with oil" })

map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
