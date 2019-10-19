" set runtimepath+=~/11_GVim runtimepath+=~/11_GVim/after
" let &packpath=&runtimepath
" source ~/11_GVim/_vimrc
set runtimepath+=~/vimfiles/autoload
let &packpath=&runtimepath
source ~/vimfiles/autoload/plug.vim

let g:python3_host_prog  = 'c:/Users/keller_o/anaconda3/python.exe'

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

Plug 'easymotion/vim-easymotion'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" eascape jh without anoying timeout phase
Plug 'zhou13/vim-easyescape'


" Requirements
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'ncm2/ncm2-ultisnips '
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-go'

Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'

Plug 'metakirby5/codi.vim'
" Codi [filetype] activates Codi for the current buffer, using the provided filetype or the buffer's filetype.
" Codi! deactivates Codi for the current buffer.
" Codi!! [filetype] toggles Codi for the current buffer, using the provided filetype or the buffer's filetype.
"     NOTE: not working?!?

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'myusuf3/numbers.vim'
call plug#end()
"---------------Plug in Ende----------------------------------------

filetype plugin indent on
nmap my :e ~/AppData/Local/nvim/init.vim
nmap smy :source ~/AppData/Local/nvim/init.vim

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

" set guifont!=Consolas
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

set completeopt=menu,menuone,longest

" This appears to be necessary; command-t doesn't appear to be falling back to
" wildignore on its own.
let g:CommandTWildIgnore=&wildignore

" A buffer becomes hidden when it is abandoned
set hid
set clipboard+=unnamed  " Yanks go on clipboard instead.


"-----------------------------------------------------------------------------
"                              searing setting                               "
"-----------------------------------------------------------------------------
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


"-----------------------------------------------------------------------------
"                               editor setting                               "
"-----------------------------------------------------------------------------
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

"- Sortfunction
vnoremap <Leader>s :sort<CR>

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

" folding for go
autocmd FileType go set fdm=syntax foldlevelstart=98
nnoremap ZA zA

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
" wb setting
nnoremap -- :.s/^./d/g<cr>:noh<cr>j
vnoremap -- :s/^./d/g<cr>:noh<cr>j
nnoremap <leader>d :s/^./d/g<cr>:noh<cr>j
vnoremap <leader>d :s/^./d/g<cr>:noh<cr>j
nnoremap 11 :.s/^./1/g<cr>:noh<cr>j
vnoremap 11 :s/^./1/g<cr>:noh<cr>j
nnoremap 22 :.s/^./2/g<cr>:noh<cr>j
vnoremap 22 :s/^./2/g<cr>:noh<cr>j
map <leader>a jIwb<c-tab>

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
nnoremap p ""p
vnoremap p ""p
nnoremap P ""P
vnoremap P ""P

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
"- Tab: switch to buffer 1
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt

"  tab einstellungen
nnoremap <leader>m :tabnext<cr>
nnoremap <leader>n :tabprev<cr>

nnoremap <c-Tab> :bnext<CR>

"-----------------------------------------------------------------------------
"                                  Terminal                                  -
"-----------------------------------------------------------------------------
" set shell=powershell.exe
set splitright     " general setting, open vsplit right
" run ipyhon in vsplit
function! Ipy()
    :vsp term://ipython.exe
endfunction
"map <leader>ip :call Ipy()
tnoremap <Esc> <C-\><C-n>
:hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

function! SendToRightBuffer()
    let t=getline('.')
    wincmd w
    startinsert

    " execute 'silent! <c-\><c-n>'
    " execute 'silent! <c-w><c-h>'
endfunction
map <a-r> :call SendToRightBuffer()


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

"
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
vnoremap " s<esc>a--<esc><left>pbi
vnoremap < s<esc>a<><esc><left>pbbi

" setze Curser links der Klammer beim schliessern
inoremap } }<esc>i


highlight abaqus_err ctermbg=red guibg=red
nnoremap <leader>c :match abaqus_err /^.\=$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G/<cr>
nnoremap <leader>cc :vimgrep "^.\=\s*$\\|P\d\+;P\\|S\d\+;S\\|G\d\+;G"%<cr>:copen 3<cr>

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
"
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
"                                    NCM2                                    "
"-----------------------------------------------------------------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })


"-----------------------------------------------------------------------------
"                                 indentLine                                 "
"-----------------------------------------------------------------------------
let g:indentLine_char = '┆'


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

"-----------------------------------------------------------------------------
"                              Helper function                               "
"-----------------------------------------------------------------------------
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
