" Neovim Settings {{{
" =============================================================================

set termguicolors
set clipboard+=unnamedplus
set pastetoggle=<f6>
set nopaste
autocmd BufWritePre * %s/\s\+$//e
set noshowmode
set noswapfile
filetype on
set  number
set numberwidth=1

" }}}

" Tabs {{{
" =============================================================================

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au Filetype javascript,typescript set expandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" }}}

" System Settings  {{{
" =============================================================================

language en_US
set encoding=utf8

set conceallevel=0
set virtualedit=
set wildmenu
set laststatus=2
set wrap linebreak nolist
set wildmode=full
set autoread
" leader is ,
let mapleader = ','
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
" Remember cursor position between vim sessions
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz
" set updatetime=500
set complete=.,w,b,u,t,k
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
set formatoptions+=t
set inccommand=nosplit
set shortmess=atIc
set isfname-==
set spell

" }}}

" Nvim terminal {{{
" =============================================================================

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufEnter term://* startinsert
autocmd TermOpen * set bufhidden=hide

" }}}

" completion {{{
" =============================================================================
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end
" }}}

" Python {{{
" =============================================================================

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}
"
" Javascript & Typescript {{{
" =============================================================================

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead,BufEnter *.jsx set filetype=javascript
  au BufNewFile,BufRead,BufEnter *.tsx set filetype=typescript
augroup END

" }}}
