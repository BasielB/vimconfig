local cmd = vim.cmd             -- execute Vim commands
local set = vim.opt
local g = vim.g                 -- global variables
local exec = vim.api.nvim_exec  -- execute Vimscript

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
-- Persistent Undo между сессиями
-----------------------------------------------------------
vim.api.nvim_exec(
[[
  set undodir=~/.vim/undodir
  if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
  endif
  set undodir=/tmp/.vim-undo-dir
  set undofile
]], false)

-----------------------------------------------------------
-- Folding
-----------------------------------------------------------
vim.api.nvim_exec([[
  set foldmethod=indent
  set foldnestmax=10
  set nofoldenable
  set foldlevel=2
  set foldcolumn=0
  highlight foldcolumn guibg=none
]], false)

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

set.timeoutlen = 300

-- Направление перевода с русского на английский
g.translate_source = 'ru'
g.translate_target = 'en'
-- -- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------
-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)
