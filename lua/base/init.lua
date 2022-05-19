local cmd = vim.cmd
local set = vim.opt

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
set.mouse = "a"
set.colorcolumn = '80'              -- Разделитель на 80 символов
set.cursorline = true               -- Подсветка строки с курсором
set.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
set.number = true                   -- Включаем нумерацию строк
set.relativenumber = true           -- Вкл. относительную нумерацию строк
set.so=999                          -- Курсор всегда в центре экрана
set.undofile = true                 -- Возможность отката назад
set.splitright = true               -- vertical split вправо
set.splitbelow = true               -- horizontal split вниз
set.swapfile = false                -- disable of creating swap files
-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
set.expandtab = true      -- use spaces instead of tabs
set.shiftwidth = 4        -- shift 4 spaces when tab
set.tabstop = 4           -- 1 tab == 4 spaces
set.smartindent = true    -- autoindent new lines
set.smarttab = true
----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
set.termguicolors = true      --  24-bit RGB colors
cmd'colorscheme onedark'

