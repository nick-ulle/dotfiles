" Filename: init.vim
" Description: NeoVim configuration file
" Maintainer: Nick Ulle

" vim-plug -----{{{1

call plug#begin('~/.config/nvim/plugged')

" Utilities
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'

" Color Schemes
Plug 'chriskempson/base16-vim'

" Languages
"Plugin 'hdima/python-syntax'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'JuliaLang/julia-vim'
Plug 'andrewmacp/llvm.vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jalvesaq/Nvim-R'

" Personal
"Plugin 'nick-ulle/REPLize'

call plug#end()

" -----}}}
" Startup -----{{{1

" Store swap files in .vim.
set directory-=.
set directory+=~/.nvim/swap

filetype plugin indent on   " Turn on filetype detection.
set fileformats+=mac        " Use mac EOLs if not unix or dos.
set encoding=utf-8          " Set default encoding.
set autochdir               " Change directory on file load.
set autoread                " Read file on update.
let g:tex_flavor = "latex"  " Use LaTeX by default.

if has("win32") || has("win64")
    set shell=cmd
else
    set shell=bash
endif

set timeoutlen=500  " Use short command timeout.

set ignorecase  " Ignore case when searching.
set smartcase   " Override 'ignorecase' when needed.
set hlsearch    " Highlight search results.

" -----}}}
" Plugin Settings -----{{{1
"
let g:markdown_fenced_languages = [
  \ 'html', 'python', 'bash=sh', 'r', 'llvm', 'cpp'
  \ ]

" Enable airline special characters.
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 0     " Disable fugitive support.
let g:airline#extensions#bufferline#enabled = 0 " Disable bufferline support.
let g:airline#extensions#syntastic#enabled = 0  " Disable syntastic support.
let g:airline#extensions#tagbar#enabled = 0     " Disable tagbar support.
let g:airline#extensions#csv#enabled = 0

" vim-pandoc
" ==========
let g:pandoc#modules#disabled = ["folding", "toc", "chdir", "keyboard"]

let g:pandoc#syntax#conceal#use = 0     " Disable conceal.
let g:pandoc#formatting#mode = "h"     " Use hard wrapping.

" Enable python syntax highlighting.
"let python_highlight_builtin_objs = 1
"let python_highlight_builtin_funcs = 1
"let python_highlight_string_format = 1

" nvim-r 
" ======
let R_vsplit = 1
let R_assign = 0
let R_nvimcom_wait = -1
let R_user_maps_only = 1
let R_csv_warn = 0
let rout_follow_colorscheme = 1

" easy-align
" ==========
let g:easy_align_ignore_groups = []

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" vim-tmux-navigator
" ==================
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>

" -----}}}

" Mappings -----{{{1

" Swap ; and .
nnoremap . ;
nnoremap ; .

" Remap Q (ex mode) to play macros.
nnoremap Q @

" Remap arrow keys to nav keys in normal/visual mode.
noremap <left> <home>
noremap <right> <end>
noremap <up> <pageup>
noremap <down> <pagedown>

" Move up and down screen lines, not file lines.
nnoremap j gj
nnoremap k gk

" Make <c-w> work in terminal insert mode.
tnoremap <c-w> <c-\><c-n><c-w>
tnoremap <c-\><c-n><c-w><c-w> <c-w>
tnoremap <esc> <c-\><c-n>

" Make vertical split syntax match e[dit]/v[iew] syntax.
"cabbrev vsv vert sv
"cabbrev vse vs
cabbrev spt split <bar> terminal
cabbrev vst vsplit <bar> terminal

" Allow saving of files as sudo when I forget to start vim using sudo.
cabbrev w!! w !sudo tee > /dev/null %

" Make :Wq act like :wq, etc...
if has("user_commands")
    command -bang -nargs=? -complete=file E e<bang> <args>
    command -bang -nargs=? -complete=file W w<bang> <args>
    command -bang -nargs=? -complete=file Wq wq<bang> <args>
    command -bang -nargs=? -complete=file WQ wq<bang> <args>
    command -bang Wa wa<bang>
    command -bang WA wa<bang>
    command -bang Q q<bang>
    command -bang QA qa<bang>
    command -bang Qa qa<bang>
endif
" -----}}}
" Leader Mappings -----{{{1

" Set <leader> to \ and <localleader> to \\
let mapleader = "\\"
let maplocalleader = "\\\\"

" Shortcuts for editing $MYVIMRC.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>wv :wq<cr>:source $MYVIMRC<cr> 

" Copy to, delete to, and paste from clipboard.
vnoremap  <leader>y   "+y
nnoremap  <leader>y   "+y
nnoremap  <leader>Y   "+y$

vnoremap  <leader>d   "+d
nnoremap  <leader>d   "+d
nnoremap  <leader>D   "+d$

nnoremap  <leader>p   "+p
vnoremap  <leader>p   "+p
nnoremap  <leader>P   "+P
vnoremap  <leader>P   "+P

" Shortcut for spellchecker.
nnoremap <leader>s :set invspell <cr>

" Shortcut for REPLize.
"nnoremap <leader>o :call REPLize()<cr>
" -----}}}
" Disabled Mappings -----{{{
" Disable the mouse.
set mouse=

" Disable arrow keys in insert mode.
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Disable the help key.
nnoremap <F1> <esc>
inoremap <F1> <esc>
vnoremap <F1> <esc>

" -----}}}
" Autocommands -----{{{1

augroup C
  autocmd!
  " Don't continue single-line C comments on new lines.
  autocmd FileType c,cpp :setlocal comments-=:// comments+=f://
augroup END

augroup Python
  autocmd!
  " Indent 4 spaces, as per PEP 8.
  autocmd FileType python :setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup R
  autocmd!
  autocmd FileType r
    \ noremap <buffer><silent> <localleader>r :call StartR("R")<cr>
  autocmd FileType r
    \ noremap <buffer><silent> <localleader>l :call SendLineToR("down")<cr>
augroup END

augroup tex
  autocmd!
  " Disable TeX indenting.
  autocmd FileType tex :setlocal indentexpr&
  " Use (== and ==) as fold markers.
  autocmd FileType tex :setlocal foldmarker=(==,==)
augroup END

augroup yaml
    autocmd!
    " Disable YAML indenting.
    autocmd FileType yaml :setlocal indentexpr&
augroup END

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
augroup fast_escape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=500
augroup END 

" Always enter terminal in insert mode and leave in normal mode.
augroup term_insert
  autocmd!
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup END

" -----}}}

" Indenting & Wrapping -----{{{1

set expandtab       " Make <Tab> insert spaces.
set tabstop=2       " Make <Tab> count for 2 spaces.
set softtabstop=2   " Make <Tab> and <BS> treat spaces as tabs.

set autoindent      " Default to indent from previous line.
set shiftwidth=2    " Indent 2 spaces.
set shiftround      " Round indents to a multiple of 'shiftwidth'.

set textwidth=79    " Maximum line width.
set colorcolumn=80  " Make column 80 colorful.

"set linebreak               " Soft-wrap lines at sane locations.
"let &showbreak = '--- '     " Indicate soft-wrapped lines with '--- '.

set nojoinspaces        " Only insert one space between joined lines.
set foldmethod=marker   " Default to using vim fold markers.
set backspace=indent,eol,start  " Allow backspacing.

set formatoptions-=l    " Auto-wrap even in insert mode.
set formatoptions+=tn   " Text: auto-wrap, numbered lists
set formatoptions+=cjqr " Comments: auto-wrap, line joins, gq, auto-insert

" Use banner style indentation for curly bracket languages.
"set cinoptions=}1s
"
" Fix indentation for R.
let r_indent_align_args = 0
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

" -----}}}
" Display -----{{{1

"set number              " Show line numbers.
"set relativenumber      " Use relative line numbers.
set numberwidth=4       " Make line numbers 4 columns wide.
set report=0            " Always report file modifications.
set display=lastline    " Show as much of last line as possible.
set scrolloff=8         " Keep 8 lines visible below current.

set showcmd     " Display partial commands in the last line.
set showmode    " Display the current mode in the last line.

set shortmess=aoOtTI
"             ||||||
"             |||||+-- Disable intro message.
"             ||||+--- Truncate long messages in the middle.
"             |||+---- Truncate long file names at the start.
"             ||+----- Message for reading file overwrites previous.
"             |+------ Message for reading file overwrites previous.
"             +------- Use abbreviated forms in messages.

" Split left to right and top to bottom.
set splitright
set splitbelow

" -----}}}
" Status Line -----{{{1

set laststatus=2    " Always show status line.

" Made obsolete by airline.
"set statusline=     " Clear the status line.
"set statusline+=%t  " File name.
"set statusline+=%{&l:modified?'\ [+]':''} " Modified flag.
"set statusline+=%(\ %r%h%w%)    " Read only, help, and preview flags.
"set statusline+=%=              " Align right.
"set statusline+={%{&ff}\ %{strlen(&fenc)?&fenc:'none'}}
"                |       |
"                |       +-- Show encoding.
"                +---------- Show format.
"set statusline+=\ {%l/%L,\ %c}
"                  |  |    |
"                  |  |    +-- Show cursor column.
"                  |  +------- Show total rows.
"                  +---------- Show cursor row.

" Store current and noncurrent status line format. Use subdued colors for
" noncurrent status line.
"let g:statusline_c = &g:statusline
"let g:statusline_nc = substitute(&g:statusline, '\v\%[2-9]\*', '', 'g')

" Automatically switch between current and noncurrent status lines.
"au WinEnter * let &l:statusline = g:statusline_c
"au WinLeave * let &l:statusline = g:statusline_nc

" -----}}}
" Highlighting -----{{{1

syntax on                           " Enable syntax highlighting.

if $TERM ==? "st-256color" || $TERM ==? "tmux"
  set termguicolors                   " Enable 24-bit true color.
  colorscheme base16-solarized-light  " Set the color scheme.
else
  colorscheme base16-atelier-forest
end

"let base16colorspace=256           " Access colors present in 256 colorspace
"set t_Co=256                       " Use 256 colors.
"set background=light               " Use a light background.

" -----}}}

" GVIM -----{{{1

if has('gui_running')
    " Make GVim look better.
    "set guifont=monofur:h12
    "set guifont=monofur\ 12
    set background=light    " Fix for xterm color-inversion weirdness.
    set guifont=Inconsolata\ for\ Powerline\ 12
    set guioptions+=rLTm    " Add flags first to fix bug.
    set guioptions-=rLTm
    "               ||||
    "               |||+- Hide the menu.
    "               ||+-- Hide the toolbar.
    "               |+--- Hide vertical scrollbar on split windows.
    "               +---- Always hide vertical scrollbar.
    set guioptions+=c " Use console dialogs.
endif

" -----}}}
