require("config.lazy")

-- to make lua_ls less annoying
local vim = vim
--------------------------------------------------------------------------------
--| Essentials                                                               |--
--------------------------------------------------------------------------------

vim.cmd [[ set clipboard+=unnamedplus ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.scrolloff = 5
vim.opt.cmdheight = 1
vim.opt.colorcolumn = "80"
vim.opt.pumheight = 14
vim.opt.tabstop = 4      -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> counts for while editing
vim.opt.wrap = false
vim.cmd('colorscheme tokyodark')

--------------------------------------------------------------------------------
--| Key Maps                                                                 |--
--------------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', '(', '()<LEFT>')
vim.keymap.set('i', '[', '[]<LEFT>')
vim.keymap.set('i', '{', '{}<LEFT>')
vim.keymap.set('i', '\"', '""<LEFT>')

vim.keymap.set('n', '<ESC>', vim.cmd.nohl)

vim.keymap.set('i', '{<CR>', '{}<LEFT><CR><ESC>ko')

vim.keymap.set('i', '<C-L>', '<RIGHT>')
vim.keymap.set('i', '<C-K>', '<UP>')
vim.keymap.set('i', '<C-J>', '<DOWN>')
vim.keymap.set('i', '<C-H>', '<LEFT>')

vim.keymap.set('n', '<TAB>', vim.cmd.bNext)
vim.keymap.set('n', '<S-TAB>', vim.cmd.bprevious)

vim.keymap.set('n', '<leader>q', ":qa")
vim.keymap.set('n', '<leader>w', ":wa<CR>")

vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', '<C-U>', '<C-U>zz')

vim.keymap.set('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    'n', '<leader>v', ':vsplit | wincmd l | :Explore<CR>', { noremap = true, silent = true }
)

vim.keymap.set('n', '<leader>jr', ':!make run<CR>')
vim.keymap.set('n', '<leader>F', ':LspZeroFormat<CR>')

vim.keymap.set('n', '<leader>ot', ':vsplit<CR>:terminal<CR>:set nonumber<CR>:set norelativenumber<CR>i')

--------------------------------------------------------------------------------
--| Debugger setup                                                           |--
--------------------------------------------------------------------------------
local dap = require('dap')

dap.adapters.codelldb = {
    name = "codelldb server",
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp -- Same for C
vim.cmd [[autocmd BufEnter *.slint :setlocal filetype=slint]]


--------------------------------------------------------------------------------
--| Rustaceanvim                                                             |--
--------------------------------------------------------------------------------
vim.g.rustaceanvim = {
    server = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    },
}

function QuickDictionaryLookup()
    local word = vim.fn.getreg('+'):gsub("%s+", "")
    if word == "" then
        print("Clipboard is empty or has no valid word.")
        return
    end
    local output = vim.fn.system({ 'wn', word, '-synsn' })
    vim.cmd("vnew")
    vim.cmd("i " .. output)
end

-- Map it to something, like <leader>d
vim.api.nvim_set_keymap('n', '<leader>pd', ':lua QuickDictionaryLookup()<CR>', { noremap = true, silent = true })

--------------------------------------------------------------------------------
--| Old timer configs that took many efforts to find                         |--
--------------------------------------------------------------------------------
--vim.diagnostic.config({
--  virtual_text = false
--})
--vim.diagnostic.config({
--    underline = true,
--    signs = true,
--    virtual_text = false,
--    float = {
--        show_header = true,
--        source = 'if_many',
--       border = 'rounded',
--      focusable = false,
--    },
--})
-- Show line diagnostics automatically in hover window
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- vim.api.nvim_set_hl(0, "Normal", { bg = transparent })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = transparent })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = transparent })
--
