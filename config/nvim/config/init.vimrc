" vim-plug Config {{{1
" =============================================================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}1

" Install Plugins {{{1
" =============================================================================
call plug#begin("~/.config/nvim/plugged")

" Color Themes {{{2
Plug 'mhartington/oceanic-next'
Plug 'w0ng/vim-hybrid'
Plug 'trevordmiller/nova-vim'
" }}}

" UI {{{2
Plug 'vim-airline/vim-airline'
Plug 'retorillo/airline-tablemode.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" }}}2

" General {{{2
Plug 'ervandew/supertab'
Plug 'benekastah/neomake', { 'on_cmd': 'Neomake' }
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
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-extra'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yssl/QFEnter'
Plug 'ludovicchabant/vim-gutentags'
" }}}2

" File Navigation {{{2
Plug 'Lokaltog/vim-easymotion'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wellle/targets.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'sheerun/vim-polyglot'
" }}}2

" Editing {{{2
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'jasonlong/vim-textobj-css'
Plug 'Konfekt/FastFold'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" }}}2

" Autocomplete {{{2
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn add global tern' }
Plug 'alexlafroscia/deoplete-flow',       { 'branch': 'pass-filename-to-autocomplete' }
" }}}2

" Git {{{2
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/gv.vim'
Plug 'pocari/vim-denite-gists'
Plug 'chemzqm/vim-easygit'
Plug 'chemzqm/denite-git'
Plug 'lambdalisue/vim-gita'
" }}}2

" Task Running {{{2
Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
" }}}2

" Python {{{2
Plug 'bps/vim-textobj-python'
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'metakirby5/codi.vim'
" }}}2

" Haskell {{{2
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'parsonsmatt/intero-neovim'
Plug 'eagletmt/neco-ghc'
" }}}2

" Javascript {{{2
Plug 'gavocanov/vim-js-indent'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'
Plug 'ternjs/tern_for_vim'
" }}}2

" Typescript {{{2
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript',       { 'do': ':UpdateRemotePlugins' }
" }}}2

" ReasonML {{{2
Plug 'reasonml-editor/vim-reason'
" }}}2

" Elm {{{2
" Plug 'lambdatoast/elm.vim'
Plug 'elmcast/elm-vim'
" }}}2

" HTML {{{2
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rstacruz/sparkup'
" }}}2

" CSS {{{2
Plug 'hail2u/vim-css3-syntax'
" }}}2

" Snippets {{{2
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'VimSnippets/vim-react-snippets'
" }}}2

call plug#end()

" }}}1
