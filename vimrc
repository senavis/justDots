filetype off "for vundle - required
set nocompatible "for vundle - required

"Vundle plugins call {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/TagHighlight'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
"Plugin 'wincent/command-t'

call vundle#end() 
filetype plugin indent on
" }}}

"common stuff for vim {{{
set fileencoding=utf-8
set encoding=utf-8
set wrap
set number 
"set ruler
set linebreak
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*~,*.class,*.pyc
set gdefault "for global search/replace
set ignorecase
set hlsearch
set autoindent
set smartcase
set incsearch
set showmatch
set mat=2
set showcmd
set backspace=indent,eol,start
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab             
set foldmethod=marker
set nolist
set smarttab
set noswapfile
set cursorline
set visualbell
set scrolloff=3
syntax on "highlight based on syntax
"system clipboard
set clipboard=unnamed
set pastetoggle=<F9>
set ttyfast "faster redraw
set title
set autoread
"}}}

"for base16 {{{
set background=dark

"if filereadable(expand("~/.vim/vimrc_background"))
"    let base16colorspace=256
"    source ~/.vim/.vimrc_background
"endif

if $TERM_PROGRAM =~ "iTerm.app" 
    let base16colorspace=256
    colorscheme base16-default
"hack for terminal color scheme 
"let g:solarized_visibility = "high"
elseif $TERM_PROGRAM =~ "Apple_Terminal"
    let g:solarized_termtrans = 1
    let g:solarized_termcolors=256
    colorscheme solarized
endif
"}}}

"Ctrlp settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
"for ctrl-p to show hidden files
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_max_files = 0
"}}}

"for windows auto-resizing {{{
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999
"}}}

"for Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

"for gvim
if has("gui_running")
    set guifont=Inconsolata\ For\ PowerLine\:h14
endif

"for vim-airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'base16'
let g:airline#extensions#bufferline#enabled = 0 "disabled bufferline to avoid the clutter buffer names 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"}}}

let mapleader="," "leader key
"autocommands {{{
"automatically resize panes on resizing
autocmd VimResized * exe "normal! \<c-w>="

autocmd BufRead,BufWritePre *.html normal gg=G
autocmd BufRead *.java normal gg=G

autocmd FileType java nnoremap <leader>c I//<esc>
autocmd FileType html nnoremap <leader>c I<!--<esc>A--><esc> 
autocmd FileType html setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType html  setlocal relativenumber 

augroup VimAutoSource
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END

augroup JavaScriptCmds
    autocmd!
    autocmd FileType javascript  nnoremap <leader>c I//<esc>
    autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 tabstop=4
augroup END
"}}}

" Statusline {{{
"hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
"hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1
"
"function! GetCWD()
"    return expand(":pwd")
"endfunction
"
"function! IsHelp()
"    return &buftype=='help'?' (help) ':''
"endfunction
"
"function! GetName()
"    return expand("%:t")==''?'<none>':expand("%:t")
"endfunction
"
"set statusline=%1*[%{GetName()}]\ 
"set statusline+=%<pwd:%{getcwd()}\ 
"set statusline+=%2*%{&modified?'\[+]':''}%*
"set statusline+=%{IsHelp()}
"set statusline+=%{&readonly?'\ (ro)\ ':''}
"set statusline+=[
"set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
"set statusline+=%{&ff}\|
"set statusline+=%{strlen(&ft)?&ft:'<none>'}
"set statusline+=]\ 
""set statusline+=%=
"set statusline+=c%c
"set statusline+=,line%l
"set statusline+=/%L\ 
"set statusline+=%p%%\ 
"
"set laststatus=2

" }}}

"custom remaps {{{
" highlight last inserted text
nnoremap gV `[v`]
"Disable arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

"Window split mapping
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Tab wrapper feature
function! InsertTabWrapper()
    let col = col(".") - 1
    if !col || getline(".")[col -1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

"Disable highlights
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ev :tabe $MYVIMRC<cr>
"nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >>
vnoremap <s-tab> <<
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>, :w<cr>
nnoremap <leader>r :e<cr>
nnoremap <leader>q :qa<cr>
nnoremap L $
nnoremap H ^
nnoremap j gj
nnoremap k gk
nnoremap D d$
nnoremap <space> za
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>a :Ag
"remap esc key
inoremap kj <ESC>
"Close current buffer
nnoremap <C-x> :q<cr>
"Disable ex-mode
nnoremap Q <NOP>
"Wipeout buffer
nnoremap <leader>b :bw<cr>

"test map for ruby
nnoremap ,rs :!BEFORE=1 rake test<cr>
"tagbar map
nmap <F8> :TagbarToggle<CR>
"}}}

"Change cursor shape between insert and normal mode in iTerm2
if $TERM_PROGRAM =~ "iTerm.app" 
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"functions start {{{

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f')<CR>
"vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
"}}}
