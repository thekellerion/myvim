"  ------------------------------------------------------------
"       Vundle
"  ------------------------------------------------------------



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=c:/users/mom/vimfiles/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('c:/users/mom/vimfiles/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"    status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'python-mode/python-mode'
Plugin 'flazz/vim-colorschemes'
" Plugin 'davidhalter/jedi-vim'
"     insall instruction https://github.com/Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" Folding for Python
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'

" align text with tabular.vim
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Standart Einstellungen Start
""""""""""""""""""""""""""""""""""""""""""""""""""""""
:syntax on


:let mapleader = ","

" automatically reload vimrc when it's saved
" au BufWritePost _vimrc so ~/_vimrc
set encoding=utf-8

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
set clipboard+=unnamed  " Yanks go on clipboard instead.
" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch!
set incsearch

set ai "Auto indent
set si "Smart indent
set nowrap! "Wrap lines
set so=5   "while moving ith j/k, set curse at line 5 when moving around
" For regular expressions turn magic on
set magic

" source vimfile
nnoremap <leader>sv :source $MYVIMRC<cr>

" disable creation of swap files
set noswapfile
set nowritebackup
set nobackup

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ffs=unix,dos,mac
" set ffs=dos

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

" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>
" inoremap " ""<left>
" inoremap ' ''<left>

" Markierter Bereich einklammern
vnoremap ( s<esc>a()<esc><left>pbbi
vnoremap { s<esc>a{}<esc><left>pbbi
vnoremap [ s<esc>a[]<esc><left>pbbi
vnoremap ' s<esc>a''<esc><left>pbi
vnoremap " s<esc>a""<esc><left>pbi


highlight abaqus_err ctermbg=red guibg=red
nnoremap <leader>c :match abaqus_err /^.\=$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G/<cr>
nnoremap <leader>cc :vimgrep "^.\=\s*$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G"%<cr>:copen 3<cr>


""""""""""""""""""""""""""""""
" => colorscheme
""""""""""""""""""""""""""""""
set linespace=0     "standard 2

set termguicolors     " enable true colors support
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="light"  " for light version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" colorscheme wombat256mod
colorscheme visualstudio
set guifont=Consolas:h11:cANSI

highlight Comment ctermbg=DarkGray
highlight Constant ctermbg=Blue
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
highlight Special ctermbg=DarkMagenta
highlight Cursor ctermbg=Green

" this next line is needed to enable your custom colors:
syntax enable

""""""""""""""""""""""""""""""
" => Einstellungen für Python
""""""""""""""""""""""""""""""
set tabstop=4 expandtab shiftwidth=4 softtabstop=4

" nnoremap <F5> :w<cr>:!python.exe %<cr>
" inoremap <F5> <esc>:w<cr>:!python.exe %<cr>

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" ===============================================
"  Python IDE Setup
"  ==============================================
" source vim-Ipython https://github.com/ivanov/vim-ipython
autocmd FileType python   :source ~/vimfiles/ftplugin/ipy.vim

"  settings for
set laststatus=2

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Ignore same warnings
let g:pymode_lint_ignore = "E222, E221, E303,E701,E251,E271"
let g:pymode_python = 'python3'

" don't use autocomppletion from pymode (use jedi vim instead)
let g:pymode_rope = 0


""" jedi-vim
" let g:jedi#auto_initialization = 0
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#usages_command = "<leader>z"
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


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
let g:airline_theme = 'angr'
" let g:airline_theme = 'minimalist'

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":tabularize /[char]
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>    " formatiert das erste zeichen nach :
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif


"  tabular function, read:http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" var video = {
    " metadata: {
        " title: "Aligning assignments"
        " h264Src: "/media/alignment.mov",
        " oggSrc: "/media/alignment.ogv"
        " posterSrc: "/media/alignment.png"
        " duration:   320,
    " }
" }

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
