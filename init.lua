require("config.lazy")

vim.opt.cmdheight = 0
vim.opt.colorcolumn = "79"
vim.opt.number = true
vim.api.nvim_set_option("clipboard","unnamed")
vim.cmd('colorscheme tokyonight')

vim.g.mapleader = ' '

vim.keymap.set('n', 'm' , vim.cmd.FineCmdline)

vim.keymap.set('i', '(' , '()<LEFT>')
vim.keymap.set('i', '{' , '{}<LEFT>')
vim.keymap.set('i', '[' , '[]<LEFT>')
vim.keymap.set('i', '\"' , '""<LEFT>')
vim.keymap.set('i', '\'' , '\'\'<LEFT>')

vim.keymap.set('n', '<ESC>' , vim.cmd.nohl)

vim.keymap.set('i', '<C-B>' , '{}<LEFT><CR><ESC>ko')
vim.keymap.set('i', '<C-L>' , '<RIGHT>')
vim.keymap.set('i', '<C-K>' , '<UP>')
vim.keymap.set('i', '<C-J>' , '<DOWN>')
vim.keymap.set('i', '<C-H>' , '<LEFT>')
vim.keymap.set('n', '<TAB>' , vim.cmd.bNext)
vim.keymap.set('n', '<S-TAB>' , vim.cmd.bprevious)
vim.keymap.set('i', '<C-S>' , function() require("flash").jump() end )

vim.keymap.set('n', '<leader>bd', vim.cmd.bdelete)

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
