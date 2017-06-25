" Themes {{{
" =============================================================================

	" For Neovim 0.1.3 and 0.1.4
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1

	" Or if you have Neovim >= 0.1.5
	if (has("termguicolors"))
	set termguicolors
	endif

	" Theme
	syntax enable
	colorscheme OceanicNext

	set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
	let g:airline_theme='oceanicnext'

" }}}

" vim-airline {{{
" =============================================================================

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#mike#enabled = 0
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#neomake#error_symbol='• '
  let g:airline#extensions#neomake#warning_symbol='•  '
  let g:airline_symbols.branch = ''
  let g:airline_theme='oceanicnext'

  tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
  tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
  tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
  tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
  tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
  tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
  tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
  tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
  tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 ',
        \}

"}}}

" vim-devicons {{{
" =============================================================================

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" neomake {{{
" =============================================================================

	autocmd! BufWritePost * Neomake

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

" Denite {{{
" =============================================================================

	let g:webdevicons_enable_denite = 0
  let s:menus = {}

  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'winheight': 10,
        \ 'reversed': 1,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal': 'CursorLine',
        \ 'updatetime': 1,
        \ 'auto_resize': 1,
        \})
  call denite#custom#option('TSDocumentSymbol', {
        \ 'prompt': ' @' ,
        \ 'reversed': 0,
        \})
  call denite#custom#var('file_rec', 'command',['rg', '--threads', '2', '--files', '--glob', '!.git'])
  " call denite#custom#source('file_rec', 'vars', {
  "       \ 'command': [
  "       \ 'ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png'
  "       \] })
  call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
  call denite#custom#source('grep', 'matchers', ['matcher_regexp'])
  call denite#custom#var('grep', 'command', ['rg'])
	call denite#custom#var('grep', 'default_opts',['--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

	nnoremap <silent> <c-p> :Denite file_rec<CR>
  nnoremap <silent> <leader>h :Denite  help<CR>
  nnoremap <silent> <leader>c :Denite colorscheme<CR>
  nnoremap <silent> <leader>b :Denite buffer<CR>
  nnoremap <silent> <leader>a :Denite grep:::!<CR>
  nnoremap <silent> <leader>u :call dein#update()<CR>
  call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
	call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
  call denite#custom#var('menu', 'menus', s:menus)

" }}}

" Git from denite {{{
" =============================================================================
	let s:menus.git = {
    \ 'description' : 'Fugitive interface',
    \}
  let s:menus.git.command_candidates = [
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

" }}}

" deoplete {{{
" =============================================================================

	" enable deoplete
  let g:deoplete#enable_at_startup = 1
  let g:echodoc_enable_at_startup=1
  set splitbelow
  set completeopt+=noselect
  set completeopt-=preview
  autocmd CompleteDone * pclose

  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
  let g:deoplete#file#enable_buffer_path=1

  call deoplete#custom#set('buffer', 'mark', 'ℬ')
  call deoplete#custom#set('ternjs', 'mark', '')
  call deoplete#custom#set('omni', 'mark', '⌾')
  call deoplete#custom#set('file', 'mark', 'file')
  call deoplete#custom#set('jedi', 'mark', '')
  call deoplete#custom#set('typescript', 'mark', '')
  call deoplete#custom#set('neosnippet', 'mark', '')

  call deoplete#custom#set('typescript',  'rank', 630)
  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
     endif
  endfunction
  autocmd WinEnter * call Preview_func()
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ['around']

" }}}

" deoplete-ternjs {{{
" =============================================================================

	" Use deoplete.
	let g:tern_request_timeout = 1
	let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

	"Add extra filetypes
	let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx'
								\]

	" Use tern_for_vim.
	let g:tern#command = ["tern"]
	let g:tern#arguments = ["--persistent"]

" }}}

" vim-multiple-cursors {{{
" =============================================================================

	let g:multi_cursor_use_default_mapping=0

	let g:multi_cursor_next_key='<C-n>'
	let g:multi_cursor_prev_key='<C-p>'
	let g:multi_cursor_skip_key='<C-x>'
	let g:multi_cursor_quit_key='<Esc>'

	" Map start key separately from next key
	let g:multi_cursor_start_key='<C-s>'
	let g:multi_cursor_start_word_key='g<C-s>'
	let g:multi_cursor_quit_key='<C-c>'
	nnoremap <C-c> :call multiple_cursors#quit()<CR>

" }}}

" UltiSnip {{{
" =============================================================================
	" <tab> => expand the snippets
    let g:UltiSnipsExpandTrigger = '<tab>'
  " <leader>ls => list available snippets start with the chars before the cursor
    let g:UltiSnipsListSnippets = '<leader>ls'
    let g:UltiSnipsJumpForwardTrigger = '<c-f>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
" }}}

" Git {{{
" =============================================================================

  let g:gitgutter_sign_column_always = 1

" }}}

" Ale (async linting) {{{
" =============================================================================

	let g:ale_linters = {
				\  'python': ['pylint'],
				\  'typescript': ['tsuquyomi', 'tslint']
				\}

	nmap <silent> <C-k> <Plug>(ale_previous_wrap)
	nmap <silent> <C-j> <Plug>(ale_next_wrap)

  let g:ale_sign_error = '⨉'
  let g:ale_sign_warning = '⚠'
  let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
	let g:ale_sign_column_always = 1
	let g:ale_emit_conflict_warnings = 0

	" Python
	let g:ale_python_pylint_args =  '--max-line-length=99 -d C0111,I0011,R0801'

	" Typescript
  let g:ale_typescript_tslint_args = '--fix'

" }}}

" syntastic {{{
" =============================================================================
	" set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*

	let g:syntastic_aggregate_errors = 1
	let g:syntastic_sort_aggregated_errors = 0
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_check_on_open = 1
	let g:syntastic_mode_map = {
	\ 'mode': 'passive',
	\ 'active_filetypes': ['typescript'],
	\ 'passive_filetypes': [] }

	map <leader>cc :SyntasticCheck<CR>
	map <leader>ct :SyntasticToggle<CR>
	map <leader>cr :SyntasticReset<CR>
	map <leader>ce :Error<CR>
	map <leader>cj :lnext<CR>
	map <leader>ck :lprevious<CR>
	nnoremap <silent> <F6> :SyntasticCheck<CR>

	" Python
	let g:syntastic_python_checkers = ['python', 'pylint']
	let g:syntastic_python_pylint_post_args = '--max-line-length=99 -d C0111,I0011,R0801'

	" Typescript
  let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
  let g:syntastic_typescript_tslint_args = "--fix"

" }}}

" Navigate between vim buffers and tmux panels {{{
" =============================================================================

  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
  tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
  tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
  tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
  tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

"}}}

" vim-test {{{
" =============================================================================

	let g:test#python#runner = 'pytest'
	nmap <silent> <leader>tn :w<CR>:TestNearest<CR>
	nmap <silent> <leader>tf :w<CR>:TestFile<CR>
	nmap <silent> <leader>ta :w<CR>:TestSuite<CR>
	nmap <silent> <leader>tl :w<CR>:TestLast<CR>
	nmap <silent> <leader>tg :w<CR>:TestVisit<CR>

" }}}

" Jedi {{{
" =============================================================================

	let g:jedi#goto_command = "<leader>gd"
	let g:jedi#goto_assignments_command = "<leader>gg"
	let g:jedi#documentation_command = "<leader>gk"
	let g:jedi#usages_command = "<leader>gn"
	let g:jedi#rename_command = "<leader>gr"

" }}}

" javascript-libraries-syntax.vim {{{
" =============================================================================

	let g:used_javascript_libs = 'underscore,angularjs,react,vue,chai,jasmine'

" }}}

" Quramy/tsuquyomi {{{
" =============================================================================

  let g:tsuquyomi_disable_quickfix = 1
  augroup ts
    autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
    autocmd FileType typescript nmap Ti <Plug>(TsuquyomiImport)
    autocmd FileType typescript nmap Td <Plug>(TsuquyomiDefinition)
    autocmd FileType typescript nmap Tr <Plug>(TsuquyomiReferences)
  augroup end

" }}}
