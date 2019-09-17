set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:/Users/keller_o/11_GVim/vim81/bundle/Vundle.vim
call vundle#begin('C:/Users/keller_o/11_GVim/vim81/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ---
" ---" python-mode Python-IDE
" ---Plugin 'klen/python-mode'
" ---
" ---" autocompl use jedi-vim  (<c-space>)
" ---Plugin 'davidhalter/jedi-vim'
" ---
" ---" Plugin 'majutsushi/tagbar'
" ---"
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"
"
Plugin 'flazz/vim-colorschemes'

    " beautiful indent guides
Plugin 'Yggdroot/indentLine'

"Pymode for python
Plugin 'python-mode/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ivanov/vim-ipython'
"
Plugin 'easymotion/vim-easymotion'


Plugin 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
"
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Setup Vundle Ende
""""""""""""""""""""""""""""""""""""""""""""""""""""""

:syntax on

:let mapleader = ","
set mouse=a
" automatically reload vimrc when it's saved
" au BufWritePost _vimrc so ~/_vimrc


""""""""""""""""""""""""""""""""""""""
""    display setting
""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

set guifont=Consolas:h13:cANSI
set linespace=0

set so=3   "while moving ith j/k, set curse at line 3 when moving around
set cursorline          " highlights the current line
set number
set autoindent
set ic
set si "Smart indent
set wrap! "Wrap lines
set ai "Auto indent

" ---Statusbar
"$HOME/vimfiles/bundle/ Height of the command bar
set cmdheight=1
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

set completeopt=menu,menuone,longest

" This appears to be necessary; command-t doesn't appear to be falling back to
" wildignore on its own.
let g:CommandTWildIgnore=&wildignore


" A buffer becomes hidden when it is abandoned
set hid
set clipboard+=unnamed  " Yanks go on clipboard instead.


""""""""""""""""""""""""""""""""""""""
""    searching setting
""""""""""""""""""""""""""""""""""""""
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch!
set incsearch

" For regular expressions turn magic on
set magic

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv


""""""""""""""""""""""""""""""""""""""
""    editor setting
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sv :source $MYVIMRC<cr>
" disable creation of swap files
set noswapfile
set nowritebackup
set nobackup

" Configure backspace so it acts as it should act
set backspace=eol,start,indent " Allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l

" Don't use ALT keys for menus, Standard wak=menu
set winaltkeys=no

set ffs=unix,dos,mac

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" tries to avoid those annoying hit -enter to continue- messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a


"" Sortfunction
vnoremap <Leader>s :sort<CR>

" :colorscheme visualstudio
" :colorscheme evening
:colorscheme Codeschool
:colorscheme Solarized

map <leader>ab :set filetype=abaqus
map <leader>py :set filetype=python

 " Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
"  für python
set tabstop=4 expandtab shiftwidth=4 softtabstop=4
nnoremap <leader>h i# -*- coding: utf-8 -*-<cr><cr><esc>

"   start ipython
command! -nargs=* Ipy :call StartIPython()<CR>
function! StartIPython()
        execute ':silent :IPython'
        :set filetype=python
        :windo wincmd L
endfunction

"  ----------------------- Comment
function! CommentToggle()
    if &filetype == 'abaqus'
        execute ':silent! s/^/\*\* /'
        execute ':silent! s/^\*\* \*\* //'
    else
        execute ':silent! s/\(^\s*\)/\1'.b:kommentar.' /'
        execute ':silent! s/\(^\s*\)'.b:kommentar.'\s*'.b:kommentar.'\s*/\1/'
    endif
endfunction

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:kommentar = '\/\/'
autocmd FileType sh,ruby,python   let b:kommentar = '\#'
autocmd FileType conf,fstab,perl  let b:kommentar = '\#'
autocmd FileType tex              let b:kommentar = '\%'
autocmd FileType mail             let b:kommentar = '\>'
autocmd FileType vim              let b:kommentar = '\"'

map ++ :call CommentToggle()<CR>j

map <cr> O<esc>j

vnoremap < <gv
vnoremap > >gv

map Y y$


"  hit esc with jk
inoremap <leader>j <esc>
vnoremap <leader>j <esc>

" ###############   behave like anything else
"select all
inoremap <c-a> <esc>ggVG
nnoremap <c-a> <esc>ggVG

"  save
inoremap <c-s> <esc>:w<esc>
nnoremap <c-s> <esc>:w<esc>
vnoremap <c-s> <esc>:w<esc>

"  copy
nnoremap <c-c> "+yy
vnoremap <c-c> "+y
inoremap <c-c> "+yy

"  cut
nnoremap <c-x> "+dd
vnoremap <c-x> "+d

"  paste
inoremap <c-v> <esc>"+p
nnoremap <c-v> "+p
vnoremap <c-v> "+p

" paste the copied text, not the last deleted
nnoremap P "0p
nnoremap P "0p

"""""""""""""""""""""""""""""""""""""
"" Movement with hjkl
nnoremap H ^
nnoremap L $
nnoremap K 3k
nnoremap J 3j

" zeile verschieben
" nnoremap <c-up> :m-2<cr>
" nnoremap <c-down> :m+<cr>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" zeile verschieben
nnoremap <A-l> xp
nnoremap <A-h> xhhp
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
""    Panel handling
""""""""""""""""""""""""""""""""""""""
"" switch back to last windows
nnoremap <A-q> <C-W><C-P>

"" Tab: toggle Tabs
nnoremap <silent> <A-^> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <A-^> :exe "tabn ".g:lasttab<cr>
inoremap <silent> <A-^> :exe "tabn ".g:lasttab<cr>
"" Tab: switch to buffer 1
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt

"  tab einstellungen
nnoremap <leader>m :tabnext<cr>
nnoremap <leader>n :tabprev<cr>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * yq/p<cr>
vnoremap <silent> # yq?p<CR>

vnoremap <space> "hy:%s/<C-r>h//gc<left><left><left>


""""""""""""""""""""""""""""""
" => Markieren mit Shift-Pfeil
""""""""""""""""""""""""""""""
nnoremap <c-left> <esc>v
inoremap <c-left> <esc>v

nnoremap <c-right> <esc>v
inoremap <c-right> <esc>v

nnoremap <c-down> <esc>v
inoremap <c-down> <esc>v

nnoremap <c-up> <esc>v
inoremap <c-up> <esc>v

""""""""""""""""""""""""""""""
" => Klammer schließen
""""""""""""""""""""""""""""""

" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>

" Markierter Bereich einklammern
vnoremap ( s<esc>a()<esc><left>pbbi
vnoremap { s<esc>a{}<esc><left>pbbi
vnoremap [ s<esc>a[]<esc><left>pbbi
vnoremap ' s<esc>a''<esc><left>pbi
vnoremap " s<esc>a""<esc><left>pbi
vnoremap < s<esc>a<><esc><left>pbbi


highlight abaqus_err ctermbg=red guibg=red
nnoremap <leader>c :match abaqus_err /^.\=$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G/<cr>
nnoremap <leader>cc :vimgrep "^.\=\s*$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G"%<cr>:copen 3<cr>

"      easy inserts without leaving normal mode
nnoremap <backspace> xh
nnoremap <delete> x
nnoremap <space>  i<space><esc>l


"      change \ into / in current line
nnoremap <leader>/ :.s/\\/\//g


" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" ===============================================
"  Python IDE Setup
"  ===============================================


"  settings for
set laststatus=2

" Ignore same warnings
let g:pymode_lint_ignore = "E222, E221, E303,E701,E251,E271"

" don't use autocomppletion from pymode (use jedi vim instead)
let g:pymode_rope = 0

let g:pymode_breakpoint = 1 " Enable breakpoints plugin
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_syntax = 1 "syntax highlightin
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 1 "0:Don't autofold code 1:enable python folding
setlocal foldmethod=expr
" let g:pymode_python = 'python3'
" ---
" ---
" ---""" jedi-vim
" ---let g:jedi#goto_command = "<leader>d"
" ---let g:jedi#goto_assignments_command = "<leader>g"
" ---let g:jedi#goto_definitions_command = ""
" ---let g:jedi#documentation_command = "K"
" ---let g:jedi#usages_command = "<leader>n"
" ---let g:jedi#completions_command = "<C-Space>"
" ---let g:jedi#rename_command = "<leader>r"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

set t_Co=256
if !exists('g:airlinesymbols')
let g:airlinesymbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''

let g:airline#extensions#tabline#show_buffers = 1
" let g:airline_theme = 'papercolor'
" let g:airline_theme = 'minimalist'
let g:airline_theme = 'angr'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouComplete me
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = 'C:/Users/keller_o/11_GVim/global_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_completion = 0    " 1 will close vim-ipython
let g:ycm_key_list_previous_completion=['<Up>']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┆'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easymotion
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader> <Plug>(easymotion-prefix)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
" edit UltiSnipsEdit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction



function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
