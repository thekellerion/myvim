set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" python-mode Python-IDE
Plugin 'klen/python-mode'

" autocompl use jedi-vim  (<c-space>)
" Plugin 'davidhalter/jedi-vim'

" Plugin 'majutsushi/tagbar'
"
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Bundle 'bling/vim-airline'


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Standart Einstellungen Start
""""""""""""""""""""""""""""""""""""""""""""""""""""""

:syntax on


:let mapleader = ","

" automatically reload vimrc when it's saved
" au BufWritePost _vimrc so ~/_vimrc
set encoding=utf-8

:colorscheme wombat256mod
set guifont=Consolas:h11:cANSI
set linespace=2


set number
set autoindent
set ic
set mouse=a

" Height of the command bar
set cmdheight=1
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hid

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch!
set incsearch

set ai "Auto indent
set si "Smart indent
set wrap! "Wrap lines
set so=5   "while moving ith j/k, set curse at line 5
" For regular expressions turn magic on
set magic


" disable creation of swap files
set noswapfile
set nowritebackup
set nobackup

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ffs=unix,dos,mac

set completeopt=menu

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500





""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  User Einstellungen
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Custom Invisibles

" set list
" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪


" Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j


" add easy date insertion
"
map <leader>.     <C-R>=strftime("%d.%m.%Y")<CR>

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" indent
vnoremap < <gv
vnoremap > >gv

" jumd to end of line
map Y y$

"  hit esc with jk
inoremap <Leader>j <esc>
vnoremap <Leader>j <esc>

"  Sortfunction
vnoremap <Leader>s :sort<CR>

""""""""""""""""""""""""""""""
" => behave like anything else
""""""""""""""""""""""""""""""
"  select all
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Pfad selectieren und oeffnen
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  copy word only
" nnoremap <leader>, bve"+y <esc>

"" select path
" nnoremap <leader>l BvE

"" open selection
" vnoremap <leader>y "hy:tabnew <C-r>h
"vnoremap <  space> "hy:%s/<C-r>h//gc<left><left><left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Movement with hjkl
nnoremap H ^
nnoremap L $
nnoremap K 3k
nnoremap J 3j


" zeile verschieben
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv



""""""""""""""""""""""""""""""
" => Panel Navigieren
""""""""""""""""""""""""""""""

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

"  backspace und delete sollen im normalmode funktionieren
nnoremap <backspace> hx
nnoremap <delete> x



""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Comment
""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ++ :call CommentToggle()<CR>j


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






""""""""""""""""""""""""""""""
" => Suchen
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * yq/p<cr>
vnoremap <silent> # yq?p<CR>

"  markierung ersetzen
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

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

" Markierter Bereich einklammern
vnoremap ( s<esc>a()<esc><left>pbbi
vnoremap { s<esc>a{}<esc><left>pbbi
vnoremap [ s<esc>a[]<esc><left>pbbi
vnoremap ' s<esc>a''<esc><left>pbi


highlight abaqus_err ctermbg=red guibg=red
nnoremap <leader>c :match abaqus_err /^.\=$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G/<cr>
nnoremap <leader>cc :vimgrep "^.\=\s*$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G"%<cr>:copen 3<cr>




""""""""""""""""""""""""""""""
" => Einstellungen für Python
""""""""""""""""""""""""""""""
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <F5> :w<cr>:!python.exe %<cr>
inoremap <F5> <esc>:w<cr>:!python.exe %<cr>




inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" ===============================================
"  Python IDE Setup
"  ===============================================


"  settings for
set laststatus=2

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Ignore same warnings
let g:pymode_lint_ignore = "E222, E221, E303,E701,E251,E271"

" don't use autocomppletion from pymode (use jedi vim instead)
let g:pymode_rope = 0


""" jedi-vim
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
" let g:airline_enable_branch     = 1
" let g:airline_enable_syntastic  = 1

if !exists('g:airlinesymbols')
let g:airlinesymbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''

let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'luna'



set t_Co=256



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
