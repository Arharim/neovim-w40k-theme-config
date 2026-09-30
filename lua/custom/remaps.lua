-- ───── Remaps: вдохновлено ThePrimeagen/init.lua ─────
-- Адаптировано: без tmux/vim-with-me/Go-сниппетов.

-- нетбук: открыть проводник (netrw; для нормальной навигации есть oil: '-' и <leader>o)
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Project [V]iew' })

-- двигать выделенные строки J/K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- склейка строк без прыжка курсора
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines (keep cursor)' })

-- центрирование при прыжках
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (center)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (center)' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (center)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result (center)' })

-- формат параграфа с сохранением позиции
vim.keymap.set('n', '=ap', "ma=ap'a", { desc = 'Format paragraph' })

-- величайший ремап всех времён: вставка без перезаписи регистра
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste (keep register)' })

-- yank в системный буфер обмена
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank to EOL (system clipboard)' })

-- delete в void-регистр (не портит буфер обмена)
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void register' })

-- "Это может меня отменить": C-c в insert работает как Esc
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Exit insert mode' })

-- казнь ex-mode
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Q' })

-- навигация по quickfix/location list с центрированием
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix (center)' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Prev quickfix (center)' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next loclist (center)' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Prev loclist (center)' })

-- замена слова под курсором по всему файлу
vim.keymap.set('n', '<leader>s',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace word under cursor' })

-- сделать текущий файл исполняемым (для скриптов embedded-тулчейна)
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Chmod +x current file' })

-- source текущего lua/vim файла
vim.keymap.set('n', '<leader>so', function()
  vim.cmd('so %')
end, { desc = 'Source current file' })

-- ───── Терминал внутри nvim ─────
-- Вертикальный сплит с терминалом справа
vim.keymap.set('n', '<leader>tt', '<cmd>vsplit term://' .. vim.o.shell .. '<CR>',
  { desc = '[T]erminal (vsplit right)' })
-- Горизонтальный сплит снизу
vim.keymap.set('n', '<leader>th', '<cmd>split term://' .. vim.o.shell .. '<CR>',
  { desc = '[T]erminal (split bottom)' })
-- В терминальном режиме: Esc Esc — выход в normal mode (навигация C-w h/l и т.д.)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Terminal: exit to normal' })
