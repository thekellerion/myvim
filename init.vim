" set runtimepath+=~/11_GVim runtimepath+=~/11_GVim/after
" let &packpath=&runtimepath
" source ~/11_GVim/_vimrc
set runtimepath+=~/vimfiles/autoload
let &packpath=&runtimepath
source ~/vimfiles/autoload/plug.vim

let g:python3_host_prog  = '$HOME/Miniconda3/python.exe'
let g:coc_node_path = '$HOME\node-v16.13.1-win-x64\node.exe'
"-----------------------------------------------------------------------------
"                            Plugin Manager start                            -
"-----------------------------------------------------------------------------

call plug#begin('~/vimfiles/plugged')
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

Plug 'flazz/vim-colorschemes'

    " beautiful indent guides
Plug 'Yggdroot/indentLine'

" move around <leader>s ....
Plug 'easymotion/vim-easymotion'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" escape jh without anoying timeout phase
Plug 'zhou13/vim-easyescape'
"
"  ---------- COC ------------
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Keeping up to date with master
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" :CocInstall coc-json coc-python coc-snippets coc-vimlsp coc-powershell
" :CocList extensions

Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'

" Plug 'metakirby5/codi.vim'
" Codi [filetype] activates Codi for the current buffer, using the provided filetype or the buffer's filetype.
" Codi! deactivates Codi for the current buffer.
" Codi!! [filetype] toggles Codi for the current buffer, using the provided filetype or the buffer's filetype.
"     NOTE: not working?!?
"


" Syntax Highlight
Plug 'sheerun/vim-polyglot'

"Powershell Plugs
Plug 'https://github.com/PProvost/vim-ps1.git'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'myusuf3/numbers.vim'
call plug#end()
"---------------Plug in Ende----------------------------------------

filetype plugin indent on

set path +=**

syntax on
syntax enable

let mapleader = ","
set mouse=a


"-----------------------------------------------------------------------------
"                              display setting                               "
"-----------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1

" set guifont=Consolas
set termguicolors
" change font size
let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction
" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

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

"set completeopt=menu,menuone,longest

" This appears to be necessary; command-t doesn't appear to be falling back to
" wildignore on its own.
let g:CommandTWildIgnore=&wildignore

" A buffer becomes hidden when it is abandoned
set hid
set clipboard+=unnamedplus   " Yanks go on clipboard instead.


"-----------------------------------------------------------------------------
"                          Set Powershell as Shell                           -
"-----------------------------------------------------------------------------
" Set PowerShell as shell
set shell=powershell.exe
set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -Command
set shellpipe=|
set shellredir=>

"-----------------------------------------------------------------------------
"                              searing setting                               "
"-----------------------------------------------------------------------------
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
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


"-----------------------------------------------------------------------------
"                               editor setting                               "
"-----------------------------------------------------------------------------
nnoremap <leader>sv :source $MYVIMRC<cr>
nmap my :e ~/AppData/Local/nvim/init.vim
nmap smy :source ~/AppData/Local/nvim/init.vim
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

"- Sortfunction
vnoremap <Leader>s :sort<CR>

"

" :colorscheme visualstudio
" :colorscheme evening
" :colorscheme Codeschool
colorscheme solarized8_dark_high

map <leader>ab :set filetype=abaqus
map <leader>py :set filetype=python

 " Insert blank lines without going into insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
"  für python
set tabstop=4 expandtab shiftwidth=4 softtabstop=4

vnoremap < <gv
vnoremap > >gv

map Y y$

"  hit esc with ,j
vnoremap <a+j> <esc>
inoremap <a+j> <esc>

nnoremap yy @a
nnoremap ya za        " falten wie mit Amerikanischer Tastatur
"-----------------------------------------------------------------------------
"                                  Comments                                  "
"-----------------------------------------------------------------------------
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
autocmd FileType go               let b:kommentar = '\/\/'
autocmd FileType sh,ruby,python   let b:kommentar = '\#'
autocmd FileType conf,fstab,perl  let b:kommentar = '\#'
autocmd FileType tex              let b:kommentar = '\%'
autocmd FileType mail             let b:kommentar = '\>'
autocmd FileType vim              let b:kommentar = '\"'

map ++ :call CommentToggle()<CR>j


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
nnoremap <c-x> ""dd
vnoremap <c-x> ""d

"  paste
inoremap <c-v> <esc>"+p
nnoremap <c-v> "+p
vnoremap <c-v> "+p

" aste the copied text, not the last deleted
vnoremap P "+P
" use unnamed register   >> x, d und p kopiert gelöschten text in register ".
" Register + (wie Windows) wird nicht geändert.
nnoremap x ""x
vnoremap x ""x
nnoremap dd ""dd
vnoremap d ""d
nnoremap p ""p
vnoremap p ""p


"-----------nnoremap------------------"
"- Movement with hjkl
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
"-------------------------------------

"-----------------------------------------------------------------------------
"                               Panel handling                               "
"-----------------------------------------------------------------------------
"- switch back to last windows
nnoremap <A-q> <C-W><C-P>

"- Tab: toggle Tabs
nnoremap <silent> <A-^> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <A-^> :exe "tabn ".g:lasttab<cr>
inoremap <silent> <A-^> :exe "tabn ".g:lasttab<cr>

nnoremap <s-Tab> :bnext<CR>

"-----------------------------------------------------------------------------
"                           searing Visual mode                              "
"-----------------------------------------------------------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * yq/p<cr>
vnoremap <silent> # yq?p<CR>

vnoremap <space> "hy:%s/<C-r>h//gc<left><left><left>


"-----------------------------
" => Markieren mit Shift-Pfeil
"-----------------------------
nnoremap <c-left> <esc>v
inoremap <c-left> <esc>v

nnoremap <c-right> <esc>v
inoremap <c-right> <esc>v

nnoremap <c-down> <esc>v
inoremap <c-down> <esc>v

nnoremap <c-up> <esc>v
inoremap <c-up> <esc>v


"-----------------------------------------------------------------------------
"                             Klammer schließen                              "
"-----------------------------------------------------------------------------
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

" setze Curser links der Klammer beim schliessern
inoremap } }<esc>i

"      easy inserts without leaving normal mode
nnoremap <backspace> xh
nnoremap <delete> x
nnoremap <space>  i<space><esc>l

"      change \ into / in current line
nnoremap <leader>/ :.s/\\/\//g<cr>
"      change \ into \\ in current line
nnoremap <leader>\ :.s/\\/\\\\/g<cr>


"-----------------------------------------------------------------------------
"                                  Airline                                   "
"-----------------------------------------------------------------------------
let g:airline_powerline_fonts = 0
" let g:airline_enable_branch     = 1
" let g:airline_enable_syntastic  = 1
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#whitespace#enabled = 1

set t_Co=256
if !exists('g:airlinesymbols')
    let g:airlinesymbols = {}
endif

" let g:airline_left_sep = '»'
" let g:airline_left_sep = ''
" let g:airline_right_sep = '«'
" let g:airline_right_sep = ''

" let g:airline_theme = 'papercolor'
" let g:airline_theme = 'minimalist'
let g:airline_theme = 'angr'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
set laststatus=2

"-----------------------------------------------------------------------------
"                                 indentLine                                 "
"-----------------------------------------------------------------------------
let g:indentLine_char = '┆'


"-----------------------------------------------------------------------------
"                                    COC                                     -
"-----------------------------------------------------------------------------
source $HOME/vimfiles/plugged/coc.nvim/autoload/coc.vim
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"-----------------------------------------------------------------------------
"                                 easymotion                                 "
"-----------------------------------------------------------------------------
map <Leader> <Plug>(easymotion-prefix)


"-----------------------------------------------------------------------------
"                                 UltiSnips                                  "
"-----------------------------------------------------------------------------
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
" edit UltiSnipsEdit!

"-----------------------------------------------------------------------------
"                               vim-easyescape                               -
"-----------------------------------------------------------------------------
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 10
inoremap jk <ESC>
vnoremap jk <ESC>
