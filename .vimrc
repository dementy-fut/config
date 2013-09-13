let g:pdv_cfg_Author = "alexey-fut <kniazalex@gmail.com>"

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "/home/alexey/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_fixers_list = ""               " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>


set encoding=utf-8
" XDebug
let g:vdebug_options = {"port":9000}
" --------------------------.vimrc------------------------------
" нам и не понадобится).
set nocompatible

" Показывать положение курсора всё время.
set ruler  

" Показывать незавершённые команды в статусбаре
set showcmd  

" Выключаем нумерацию строк
set nonu

" Write all tmp files to /tmp
set dir=/tmp

" Поиск по набору текста (очень полезная функция)
set incsearch

" Неотключаем подстветку найденных вариантов, и так нифига не видно.
" set nohlsearch
set hlsearch

" Игнорирование регистра
set ignorecase
set smartcase

" Ignore files
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.gif,*.xpm

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=1

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=1

" Выключаем надоедливый "звонок"
set novisualbell
"set visualbell " вместо писка бипером показывать это на экране

"" Подсвечивать табы и пробелы в конце строки
set nolist " включить подсветку
set listchars=tab:>-,trail:-,eol:↲,extends:▸,precedes:◂ " установить символы, которыми будет осуществляться подсветка

" При вставке фрагмента сохраняет отступы
set pastetoggle=

" Поддержка мыши
"set mouse=a
"set mousemodel=popup

" Кодировка текста по умолчанию
set termencoding=latin1,utf-8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" Включить автоотступы
set autoindent

" Влючить подстветку синтаксиса
syntax on

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Преобразование Таба в пробелы
set expandtab

" Использовать больше цветов в терминале
set t_Co=256 

" Использовать диалоги вместо сообщений об ошибках
" set confirm 

" Miscellaneous
set showmatch       " show matching brackets
set autoread        " automatically read file changes outside of vim
set nostartofline   " don't jump to first character when paging
set cursorline      " highlight the current line
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE guibg=NONE guifg=NONE

" Disable backup files
set nobackup
set noswapfile

" Ctrl-пробел для автодополнения
inoremap <C-space> <C-o><C-x>
inoremap <C-space> <C-p>

map , <C-w><C-w>

" C-e - комментировать/раскомментировать (при помощи NERD_Comment)
map <C-t> ,ci
nmap <C-t> ,ci
imap <C-t> <ESC>,cii

" C-s - быстрое сохранение
map <C-s> :w<cr>
nmap <C-s> :w<cr>
vmap <C-s> <esc>:w<cr>i
imap <C-s> <esc>:w<cr>i

" Вырезать-копировать-вставить через Ctrl
vnoremap <C-X> "+x " CTRL-X - вырезать
vnoremap <C-C> "+y  " CTRL-C - копировать
map <C-V>      "+gP " CTRL-V вставить под курсором

" Отменить-вернуть через Ctrl
noremap <C-Z> u " отмена действия
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R> " вернуть отменённое назад
inoremap <C-Y> <C-O><C-R>

" Переключение табов (вкладок)
map <S-Tab> :tabprevious <CR>
imap <S-Tab> <Esc> :tabprevious <CR>i
" map <C-Tab> :tabnext <CR>
" imap <C-Tab> <Esc> :tabnext <CR>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
nmap <C-w> :tabclose<cr>
imap <C-w> <ESC>:tabclose<cr>

if has("autocmd")
" au is short for autocmd
 
 " Restore cursor position
 autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

 " Change statusline color in insert mode
 autocmd InsertEnter * highlight StatusLine ctermfg=2 ctermbg=2
 autocmd InsertLeave * highlight StatusLine ctermfg=4 ctermbg=7

 " Change statusline color of active window
 autocmd VimEnter * highlight StatusLine term=reverse ctermfg=4 ctermbg=7 gui=bold,reverse

 " Set Filetypes
 autocmd BufNewFile,BufRead *.less setfiletype css
 autocmd BufNewFile,BufRead *.liquid setfiletype liquid

 " Filetypes
 autocmd FileType javascript setlocal ts=2 sts=2 sw=2
 autocmd FileType helpfile setlocal nonumber      " no line numbers when viewing help
 autocmd FileType helpfile nnoremap   " Enter selects subject
 autocmd FileType helpfile nnoremap   " Backspace to go back
endif

"ВКЛЮЧЕНИЕ АВТОДОПЛНЕНИЯ ВВОДА (omnifunct)
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType php inoremap <F9> <Esc> :w!<CR>:!/usr/bin/php %<CR>
autocmd FileType php noremap <F9> <Esc> :w!<CR>:!/usr/bin/php %<CR>

autocmd FileType php noremap <C-F9> <Esc> :w!<CR>:!php-cs-fixer fix $@ --fixers=linefeed,short_tag,indentation,trailing_spaces,unused_use,phpdoc_params,visibility,return,include,php_closing_tag,extra_empty_lines,elseif,eof_ending %<CR>
autocmd FileType php inoremap <C-F9> <Esc> :w!<CR>:!php-cs-fixer fix $@ --fixers=linefeed,short_tag,indentation,trailing_spaces,unused_use,phpdoc_params,visibility,return,include,php_closing_tag,extra_empty_lines,elseif,eof_ending,controls_spaces %<CR>
" autocmd FileType php noremap <Esc><C-F9> :w!<CR>:!/usr/bin/php % ./configs/config.php<CR>

"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)
" set foldenable " включить фолдинг
" set foldmethod=syntax " определять блоки на основе синтаксиса файла
" set foldcolumn=3 " показать полосу для управления сворачиванием
" set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
" let perl_folding=1 " правильное сворачивание классов и функций Perl
" let php_folding=1 " правильное сворачивание классов и функций PHP
" set foldopen=all " автоматическое открытие сверток при заходе в них

"НАСТРОЙКИ ВНЕШНЕГО ВИДА
" Установка шрифта (для Windows и Linux)
if has('gui')
   if has('win32')
    set guifont=Lucida_Console:h10:cRUSSIAN::
   else
    " set guifont=Terminus\ 10
   endif
endif

" Разворачивать окно редактора на весь экран
if has('gui')
        set guioptions-=T " отключить меню в GUI
    au GUIEnter * :set lines=99999 columns=99999
endif

"
" Functions
"

function! ReloadAllBuffers()   
 set noconfirm                
 :bufdo e!                    
 set confirm                  
endfunction

" Размер табулации по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

" Включаем "умные" отспупы ( например, автоотступ после {)
" set smartindent

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N

" выключить подсветку: повесить на горячую клавишу Ctrl-F8
nnoremap <C-F8> :nohlsearch<CR>

" Не переносить длинные строки
set wrap
set linebreak

" Key mapping for Russian QWERTY keyboard in UTF-8
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
"-------------------------
" Горячие клавишы
"-------------------------

" Пробел в нормальном режиме перелистывает страницы
" nmap <Space> <PageDown>

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
" nmap <C-V> +gP
" imap <C-V> <esc>+gPi
" vmap <C-C> +yi
"map <C-C> y
"imap <C-C> +yi
"map <C-V> <MiddleMouse>
"imap <C-V> <MiddleMouse>

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-d - удаление текущей строки
nmap <C-x> dd
imap <C-x> <esc>ddi

" C-e - дублирование текущей строки
nmap <C-d> yyp
imap <C-d> <esc>yypi

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - Вкл. Выкл. Нумерации строк
nmap <F3> :set nu!<cr>
vmap <F3> <esc>:set nu!<cr>i
imap <F3> <esc>:set nu!<cr>i

" F4 - Set list
nmap <F4> <Esc>:set list!<cr> 
vmap <F4> <esc>:set list!<cr> 
imap <F4> <esc><esc>:set list!<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
" map <F6> :bp<cr>
" vmap <F6> <esc>:bp<cr>i
" imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
" map <F7> :bn<cr>
" vmap <F7> <esc>:bn<cr>i
" imap <F7> <esc>:bn<cr>i

" F8 - Set paste
map <F8> <esc>:set paste!<cr>
vmap <F8> <esc>:set paste!<cr>i
imap <F8> <C-O>:set paste!<cr>i

" F9 - "tabnext" переключиться на следующий таб
" map <F9> :tabnext <CR>
" imap <F9> <Esc> :tabnext <CR>i

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - показать окно Taglist
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - обозреватель файлов
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
" imap <Ins> <esc>i  
imap <Ins> <Esc>wq

" Open tag under cursor in new tab
map <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt


" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.latin1 :e ++enc=latin1 <CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" Редко когда надо [ без пары =)
" imap [ []<LEFT>
" Аналогично и для {
" imap {<CR> {<CR>}<Esc>O

" С-q - выход из Vim
map <C-Q> <Esc>:qa<cr>

"-------------------------
" Useful functions
"-------------------------

" Make <Backspace> act as <Delete> in Visual mode?
vmap <BS> x

" Wrap selected text to 80 symbols per line
vmap <C-b> <esc>:'<,'>!fold -w 120 -s<cr>

" function MoveTabLeft()
"    let current_tab = tabpagenr()
"  if current_tab > 1
"      let current_tab = current_tab - 2
"      execute 'tabmove' current_tab
"   endif
" endfunction

" function MoveTabRight()
"   let current_tab = tabpagenr()
"   execute 'tabmove' current_tab
" endfunction

" Автозавершение слов по tab =)
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
" imap <tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов
set complete+=t

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype on
filetype indent on
filetype plugin on
" au BufRead,BufNewFile *.phps    set filetype=php
" au BufRead,BufNewFile *.thtml    set filetype=php

set formatoptions+=r

" Настройки для SessionMgr
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Настройки для Tlist (показвать только текущий файл в окне навигации по  коду)
let g:Tlist_Show_One_File = 1

set completeopt-=preview
set completeopt+=longest
set mps-=[:]

" Подсветка строк длинее 120 символов
" set colorcolumn=125
if exists('+colorcolumn')
    " highlight ColorColumn ctermbg=235 guibg=#2c2d27
    " highlight CursorLine ctermbg=233 guibg=#2c2d27
    " highlight CursorColumn ctermbg=235 guibg=#2c2d27
    " let &colorcolumn=join(range(81,999),",")
else
    " autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end
