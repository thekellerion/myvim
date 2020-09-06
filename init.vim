" ------------------------------------------------------------
"
" Vundle
" ------------------------------------------------------------
scriptencoding utf8
"
"
set nocompatible              " be improved, required
" filetype off                  " required

call plug#begin('~\AppData\Local\nvim\plugged')

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" visual indent lines
Plug 'Yggdroot/indentLine'

" motion with <leader><leader> s <char>
Plug 'easymotion/vim-easymotion'

" ultimate solution for snippets in Vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" eascape jh without anoying timeout phase
" Plug 'zhou13/vim-easyescape'

" Plug 'davidhalter/jedi-vim'
" Plug 'Vigemus/iron.nvim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              COC conquer of command                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
" einmal zum installieren folgende Befehle ausfuehren
" :CocInstall coc-html
" :CocInstall coc-snippets
"             coc-rename

" Folding for Python
" Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'

"code colding
Plug 'pseewald/vim-anyfold'

" CtrlP – Fuzzy File, Buffer and Tag Finder
" Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


" :PlugInstall
" :PlugUpdate
" :PlugClean
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Standart Einstellungen Start
""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " required

:syntax on
:let mapleader = ","

set path +=**
nmap my :e ~/AppData/Local/nvim/init.vim
nnoremap <leader>sv :source $MYVIMRC<cr>


" automatically reload vimrc when it's saved
" au BufWritePost _vimrc so ~/_vimrc
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

set number
set autoindent
set ic
set mouse=a

" Height of the command bar
set cmdheight=1
" Turn on the WiLd menu   ( are used for command line completion )
set wildmode=longest:list,full


" A buffer becomes hidden when it is abandoned
set hid
set clipboard+=unnamedplus  " Yanks go on clipboard instead.
set ai "Auto indent
set si "Smart indent
set wrap! "Wrap lines
set so=5   "while moving ith j/k, set curse at line 5 when moving around
" For regular expressions turn magic on
set magic

" source vimfile
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>my :tabnew $MYVIMRC
" disable creation of swap files
set noswapfile
set nowritebackup
set nobackup

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ffs=unix,dos,mac
" set ffs=dos

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set autoread                    " Automatically read changed files
set relativenumber
set noshowmode                  " We show the mode with airline or lightline

set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set modelines=0                 " default 5

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
map <leader>.     <C-R>=strftime("%d.%m.%Y")<CR>

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" indent
vnoremap < <gv
vnoremap > >gv

" jumd to end of line
map Y y$

"Folding
nnoremap za zA
nnoremap ya zA

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
noremap p "0p
vnoremap p "0p

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
nnoremap <backspace> hx<CR>
nnoremap <delete> x
nnoremap <space> i <esc>

nnoremap <c-tab> :bnext<cr>

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
" Visual mode pressing * or # searches for the current selection,
" vnoremap <silent> * yq/p<cr>
" vnoremap <silent> # yq?p<CR>

" use this instead, code apove can't handle . \ usw
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"  markierung ersetzen
vnoremap <space> "hy:%s/<C-r>h//gc<left><left><left>

set smartcase

" Highlight search results
set hlsearch
set incsearch
" set nohlsearch with <cr> or <esc>
:nnoremap <CR> :nohlsearch<CR><CR>
:nnoremap <esc> :nohlsearch<CR><CR>

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.

nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

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
vnoremap < s<esc>a<><esc><left>pbbi
vnoremap ' s<esc>a''<esc><left>pbi
vnoremap " s<esc>a""<esc><left>pbi

" setze Curser links der Klammer beim schliessern
inoremap } }<esc>i

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
" colorscheme Lucius
colorscheme solarized8_dark_high
" colorscheme visualstudio
" colorscheme solarized8_dark_high
" colorscheme solarized
" highlight Comment ctermbg=DarkGray
" highlight Constant ctermbg=Blue
" highlight Normal ctermbg=Black
" highlight NonText ctermbg=Black
" highlight Special ctermbg=DarkMagenta
" highlight Cursor ctermbg=Green
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
" set background=dark " use dark mode
" set background=light " uncomment to use light mode

" this next line is needed to enable your custom colors:
syntax enable

""""""""""""""""""""""""""""""
" => Einstellungen für Python
""""""""""""""""""""""""""""""
set tabstop=4 expandtab shiftwidth=4 softtabstop=4
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
" ===============================================
"  Python IDE Setup
"  ==============================================
" source vim-Ipython https://github.com/ivanov/vim-ipython
" autocmd FileType python   :source ~/vimfiles/ftplugin/ipy.vim

"  settings for
set laststatus=2

set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

if !exists('g:airlinesymbols')
let g:airlinesymbols = {}
endif
"
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''

" let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'angr'
" let g:airline_theme = 'minimalist'

set nofoldenable

set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┆'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" YouCompleteMe
" let g:ycm_key_list_previous_completion=['<Up>']
" let g:UltiSnipsExpandTrigger="<s-tab>"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<a-n>"
let g:UltiSnipsJumpBackwardTrigger="<a-b>"
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"
""-----------------------------------------------------------------------------
"                               vim-easyescape                               -
"-----------------------------------------------------------------------------

" let g:easyescape_chars = { "j": 1, "k": 1 }
" let g:easyescape_timeout = 10
" inoremap jk <ESC>
" vnoremap jk <ESC>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  COC                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" set shortmess=a    at work
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
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
inoremap <silent><expr> <c-space> coc#refresh()
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             smart renaming !!!!                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
"
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  anyfold                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:anyfold_fold_comments=0
autocmd Filetype * AnyFoldActivate     " activate for all filetypes
" or
" autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype

set foldlevel=0
hi Folded term=BOLD cterm=NONE

" disable anyfold for large files
let g:LargeFile = 1000000 " file is large if size greater than 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function LargeFile()
    augroup anyfold
        autocmd! " remove AnyFoldActivate
        autocmd Filetype <filetype> setlocal foldmethod=indent " fall back to indent folding
    augroup END
endfunction
