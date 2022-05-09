local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Типа 'Нажимает' на ESC при быстром нажатии jk, чтобы не тянутся
map('i', 'jk', '<Esc>', {noremap = true})
-- Rename Space as leader key
map('', '<Space>', '<Nop>', default_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Normal --
-- Better window navigation
map('n', '<C-h>', '<cmd>lua require"smart-splits".move_cursor_left()<cr>', default_opts)
map('n', '<C-j>', '<cmd>lua require"smart-splits".move_cursor_down()<cr>', default_opts)
map('n', '<C-k>', '<cmd>lua require"smart-splits".move_cursor_up()<cr>', default_opts)

map('n', '<C-l>', '<cmd>lua require"smart-splits".move_cursor_right()<cr>', default_opts)
-- Resize window with arrows
map('n', '<C-Up>', '<cmd>lua require"smart-splits".resize_up(2)<cr>', default_opts)
map('n', '<C-Down>', '<cmd>lua require"smart-splits".resize_down(2)<cr>', default_opts)
map('n', '<C-Left>', '<cmd>lua require"smart-splits".resize_left(2)<cr>', default_opts)
map('n', '<C-Right>', '<cmd>lua require"smart-splits".resize_right(2)<cr>', default_opts)

-- Стрелочки откл. Использовать hjkl
map('', '<up>', ':echoe "Use k"<CR>', default_opts)
map('', '<down>', ':echoe "Use j"<CR>', default_opts)
map('', '<left>', ':echoe "Use h"<CR>', default_opts)
map('', '<right>', ':echoe "Use l"<CR>', default_opts)

-- Navigate in Buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", default_opts)
map("n", "}", "<cmd>BufferLineMoveNext<cr>", default_opts)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", default_opts)
map("n", "{", "<cmd>BufferLineMovePrev<cr>", default_opts)

-- Move Text up and down. It's funny
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", default_opts)
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", default_opts)

-- Standart Operations
map("n", "<leader>w", "<cmd>w<CR>", default_opts)
map("n", "<leader>q", "<cmd>q<CR>", default_opts)
map("n", "<leader>h", "<cmd>nohlsearch<CR>", default_opts)
map("n", "<C-q>", "<cmd>q!<CR>", default_opts)

-- Neotree
map("n", "<leader>e", ":NvimTreeToggle<CR>", default_opts)

-- TagBar
map("n", "<leader>o", ":TagbarToggle<CR>", default_opts)

-- fzf
-- map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
-- map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)

-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", default_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", default_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", default_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", default_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", default_opts)
map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", default_opts)

-----------------------------------------------------------
-- Фн. клавиши по F1 .. F12
-----------------------------------------------------------
-- <F2> для временной вставки из буфера, чтобы отключить авто идент
vim.o.pastetoggle='<F2>'
-- <F3> перечитать конфигурацию nvim Может не работать, если echo $TERM  xterm-256color
map('n', '<F3>', ':so ~/.config/nvim/init.lua<CR>:so ~/.config/nvim/lua/plugins.lua<CR>:so ~/.config/nvim/lua/settings.lua<CR>:so ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <S-F3> Открыть всю nvim конфигурацию для редактирования
map('n', '<S-F3>', ':e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/settings.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <F4> Поиск слова под курсором
map('n', '<F4>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-- <F5> разные вариации нумераций строк, можно переключаться
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
