" System mappings  {{{
" =============================================================================

" map Leader
let mapleader = ","
" keep backward f search, remapping it to ,;
nnoremap <Leader>; ,

" No need for ex mode
nnoremap Q <nop>
vnoremap // y/<C-R>"<CR>
" recording macros is not my thing
map q <Nop>
" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi
" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
" copy current files path to clipboard
nmap cp :let @+= expand("%") <cr>
" Neovim terminal mapping
" terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>
" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
" nnoremap K 5k
" this is the best, let me tell you why
" how annoying is that everytime you want to do something in vim
" you have to do shift-; to get :, can't we just do ;?
" Plus what does ; do anyways??
" if you do have a plugin that needs ;, you can just swap the mapping
" nnoremap : ;
" give it a try and you will like it
nnoremap ; :
inoremap <c-f> <c-x><c-f>
" Copy to osx clipboard
vnoremap <C-c> "*y<CR>
" vnoremap y "*y<CR>
" nnoremap Y "*Y<CR>
" vnoremap y myy`y
" vnoremap Y myY`y

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <c-/> :TComment<cr>
nnoremap <silent> <esc> :noh<cr>
nnoremap <leader>e :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

noremap <Leader>src :so $MYVIMRC<CR>

noremap <Leader>ct :checktime<CR>

" non-US keyboard
nmap ø [
nmap æ ]
omap ø [
omap æ ]
xmap ø [
xmap æ ]

" show current file path
nmap <Leader>pwd :<C-u>echo @%<CR>

" pretty up JSON data
nnoremap <Leader>j !!python -m json.tool<CR>
nnoremap <Leader>J :%!python -m json.tool<CR>
xnoremap <Leader>j :!python -m json.tool<CR>

" }}}

" Navigation {{{
" =============================================================================
" in-line scrolling
nmap <Leader>j gj
nmap <Leader>k gk

" buffer keys
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :bf<CR>
nnoremap <Leader>bl :bl<CR>
nnoremap <Leader>bw :w<CR>:bd<CR>
nnoremap <Leader>bd :bd!<CR>
nnoremap <Leader>bda :bufdo bd!<CR>
" new buffer/tab
nnoremap <Leader>e :enew<CR>
tmap <Leader>bd <c-\><c-n>:bp! <BAR> bd! #<CR>
nmap <Leader>bt :term<cr>

" window keys
nnoremap <Leader>w< <C-w><
nnoremap <Leader>w> <C-w>>
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w+ <C-w>+
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wx :close<CR>

" %% to expand active buffer location on cmdline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" split navigations
nnoremap J <C-W><C-J>
nnoremap K <C-W><C-K>
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>

" }}}

" Folds {{{
" =============================================================================

nnoremap <Leader>ff za
nnoremap <Leader>fr zA
nnoremap <Leader>fa zM
nnoremap <Leader>fo zR
vnoremap <Leader>ff zf

" Movement
nnoremap <Leader>fj zj
nnoremap <Leader>fk zk

" }}}

" File managment {{{
" =============================================================================
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>

" }}}
