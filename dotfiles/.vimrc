set nocompatible

" Unmap arrow keys
nnoremap <down> :<down>
nnoremap <left> <Nop>
nnoremap <right> <Nop>
nnoremap <up> :<up>

execute pathogen#infect()
syntax on
filetype on

" Use pathogen to include plugins from the ~/.vim/bundle directory
call pathogen#helptags()

set path=$PWD/**

set hidden        " preserve buffer in background when switching to new file
set nowrap        " don't wrap lines
set backspace=indent,eol,start
                " allow backspacing over everything in insert mode
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nobackup
set noswapfile
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
"set title                " change the terminal's title
"set visualbell           " don't beep
"set noerrorbells         " don't beep
set sessionoptions-=options
set splitbelow
set splitright

" Tabulation
filetype plugin indent on
set expandtab     " always use spaced instead of hard tabs
set autoindent    " always set autoindenting on
set tabstop=4     " a tab is four spaces
set copyindent    " copy the previous indentation on autoindenting
set smarttab      " insert tabs on the start of a line according to
                "    shiftwidth, not tabstop
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4  " number of spaces to use for autoindenting
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0    " not for Makefiles
"map <F6> :set et<CR>:%retab<CR>:%s/[ \t]\+$//g<CR>
nnoremap <silent> <F6> :%retab<CR>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set pastetoggle=<F10>

let eadirection = 'ver'

" Color Scheme
colorscheme jellybeans

" Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set laststatus=2

" Navigate and manipulate windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>= <C-W>+
map <leader>- <C-W>-
map <leader>. <C-W>>
map <leader>, <C-W><

" Create windows or buffers
" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topright new<CR>
nmap <leader>sw<down>  :botleft  new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

command Bd bp | | sp | bn | bd

" Insert a new line from normal mode, and remain there
nnoremap <S-CR> O<Esc>
nnoremap <S-Enter> O<Esc>

" Auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz

" Navigate + Center
nnoremap L Lzz
nnoremap H Hzz
inoremap <C-left> <ESC>bi
inoremap <C-right> <ESC>wi

"quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

map <leader>vimrc :tabe ~/.vimrc<cr>
" autocmd bufwritepost ~/.vimrc source $MYVIMRC

" Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:botright cw<CR>

" Reset highlighted search
nnoremap <CR> :let @/=""<CR><CR>

" Resize NERDTree Window
let g:NERDTreeWinSize = 40




