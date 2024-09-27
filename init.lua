require("config.lazy")

vim.cmd[[ set clipboard+=unnamedplus ]]
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "79"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.pumheight=10
vim.cmd('colorscheme catppuccin-mocha')
vim.opt.scrolloff = 999 
--vim.diagnostic.config({
--  virtual_text = false
--})

-- Show line diagnostics automatically in hover window
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

vim.opt.tabstop = 4         -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4      -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.softtabstop = 4     -- Number of spaces a <Tab> counts for while editing
vim.opt.wrap = false

vim.g.mapleader = ' '

vim.keymap.set('n', 'm' , vim.cmd.FineCmdline)

vim.keymap.set('i', '(' , '()<LEFT>')
vim.keymap.set('i', '[' , '[]<LEFT>')
vim.keymap.set('i', '{' , '{}<LEFT>')
vim.keymap.set('i', '\"' , '""<LEFT>')

vim.keymap.set('n', '<ESC>' , vim.cmd.nohl)

vim.keymap.set('i', '{<CR>' , '{}<LEFT><CR><ESC>ko')

vim.keymap.set('i', '<C-L>' , '<RIGHT>')
vim.keymap.set('i', '<C-K>' , '<UP>')
vim.keymap.set('i', '<C-J>' , '<DOWN>')
vim.keymap.set('i', '<C-H>' , '<LEFT>')
vim.keymap.set('n', '<TAB>' , vim.cmd.bNext)
vim.keymap.set('n', '<S-TAB>' , vim.cmd.bprevious)
vim.keymap.set('i', '<C-S>' , function() require("flash").jump() end )

vim.keymap.set('n', '<leader>q',":qa")
vim.keymap.set('n', '<leader>w', ":wa")

vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', '<C-U>', '<C-U>zz')

vim.keymap.set('n', '<leader>e', ':Lexplore<CR>' ,{ noremap = true, silent = true })
vim.api.nvim_set_keymap(
	'n', '<leader>v', ':vsplit | wincmd l | :Explore<CR>', { noremap = true, silent = true }
)
vim.keymap.set('n', '<C-J>', '<C-W>j')
vim.keymap.set('n', '<C-H>', '<C-W>h')
vim.keymap.set('n', '<C-K>', '<C-W>k')
vim.keymap.set('n', '<C-L>', '<C-W>l')
