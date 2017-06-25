" Tabs {{{
" =============================================================================
  set tabstop=2
  set softtabstop=2
	set shiftwidth=2
	set expandtab

  autocmd Filetype javascript,typescript setlocal ts=4 sw=4 sts=0 expandtab

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
  set shortmess=atIc
  set isfname-==
  set spell

" }}}

" vim-plug Config {{{1
" =============================================================================
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
" }}}1

" Install Plugins {{{1
" =============================================================================
	call plug#begin("~/.vim/plugged")

" Color Themes {{{2
	Plug 'mhartington/oceanic-next'
	Plug 'w0ng/vim-hybrid'
" }}}

" UI {{{2
	Plug 'vim-airline/vim-airline'
	Plug 'retorillo/airline-tablemode.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/goyo.vim'
" }}}2

" General {{{2
	Plug 'ervandew/supertab'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'tomtom/tcomment_vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	Plug 'terryma/vim-smooth-scroll'
	Plug 'terryma/vim-expand-region'
	Plug 'ntpeters/vim-better-whitespace'
" }}}2

" Project Navigation {{{2
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'Shougo/unite.vim'
" }}}2

" File Navigation {{{2
	Plug 'Lokaltog/vim-easymotion'
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'wellle/targets.vim'
	Plug 'haya14busa/incsearch.vim'
" }}}2

" Editing {{{2
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'kana/vim-textobj-user'
	Plug 'sgur/vim-textobj-parameter'
	Plug 'jasonlong/vim-textobj-css'
	Plug 'Konfekt/FastFold'
	Plug 'jiangmiao/auto-pairs'
	Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" }}}2

" Git {{{2
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/gv.vim'
" }}}2

	call plug#end()
" }}}1


" Themes {{{
" =============================================================================

	" Theme
	syntax enable
	colorscheme OceanicNext

	set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
	let g:airline_theme='oceanicnext'

" }}}

" vim-devicons {{{
" =============================================================================

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" Smooth scroll {{{
" =============================================================================

	noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 12, 2)<CR>
	noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 14, 2)<CR>
	noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 22, 4)<CR>
	noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 24, 4)<CR>

" }}}

" vim-expand-region {{{
" =============================================================================

	map K <Plug>(expand_region_expand)
	map J <Plug>(expand_region_shrink)

" }}}

" vim-better-whitespace {{{
" =============================================================================

	autocmd BufEnter * EnableStripWhitespaceOnSave

" }}}

" NERDTree {{{
" =============================================================================

	map <silent> - :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  let g:NERDTreeAutoDeleteBuffer=1

  " let g:webdevicons_enable_nerdtree = 0
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  " let g:NERDTreeFileExtensionHighlightFullName = 1

	let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''

" }}}

" unite {{{
" =============================================================================
  let g:completor_node_binary="/usr/local/bin/node"
  let g:completor_python_binary = ' /usr/local/lib/python3.5/site-packages'
  let g:unite_data_directory='~/.nvim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='» '
  let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

  nnoremap <silent> <c-p> :Unite -auto-resize -start-insert -direction=botright file_rec/async<CR>
  nnoremap <silent> <leader>c :Unite -auto-resize -start-insert -direction=botright colorscheme<CR>
  nnoremap <silent> <leader>u :Unite neobundle/update<CR>

  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()

  function! s:unite_settings() "{{{
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  endfunction

" }}}

" Git from unite...ERMERGERD {{{
" =============================================================================

  let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
  let g:unite_source_menu_menus.git = {
    \ 'description' : 'Fugitive interface',
    \}
  let g:unite_source_menu_menus.git.command_candidates = [
    \[' git status', 'Gstatus'],
    \[' git diff', 'Gvdiff'],
    \[' git commit', 'Gcommit'],
    \[' git stage/add', 'Gwrite'],
    \[' git checkout', 'Gread'],
    \[' git rm', 'Gremove'],
    \[' git cd', 'Gcd'],
    \[' git push', 'exe "Git! push " input("remote/branch: ")'],
    \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
    \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
    \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
    \[' git fetch', 'Gfetch'],
    \[' git merge', 'Gmerge'],
    \[' git browse', 'Gbrowse'],
    \[' git head', 'Gedit HEAD^'],
    \[' git parent', 'edit %:h'],
    \[' git log commit buffers', 'Glog --'],
    \[' git log current file', 'Glog -- %'],
    \[' git log last n commits', 'exe "Glog -" input("num: ")'],
    \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
    \[' git log until date', 'exe "Glog --until=" input("day: ")'],
    \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
    \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
    \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
    \[' git mv', 'exe "Gmove " input("destination: ")'],
    \[' git grep',  'exe "Ggrep " input("string: ")'],
    \[' git prompt', 'exe "Git! " input("command: ")'],
    \] " Append ' --' after log to get commit info commit buffers
  nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>

" }}}
