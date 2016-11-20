if &compatible
    set nocompatible
endif
" deinパス設定
let s:dein_dir = fnamemodify('~/dein/', ':p') "<-お好きな場所
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim' "<-固定

" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim本体をランタイムパスに追加
if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 必須
call dein#begin(s:dein_dir)
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/vimproc', {'build': 'make'})

" Plugins
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})

call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/vimfiler.vim')
call dein#add('ujihisa/unite-colorscheme')

call dein#add('tomasr/molokai')
" call dein#add('scrooloose/syntastic')
call dein#add('Shougo/vimshell.vim')
" call dein#add('jiangmiao/auto-pairs')
call dein#add('fatih/vim-go')
" call dein#add('pbogut/deoplete-padawan')
call dein#add('tpope/vim-fugitive')

" 必須
call dein#end()
filetype plugin indent on
syntax enable

" プラグインのインストール
if dein#check_install()
  call dein#install()
endif

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const' ]
let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#use_cache = 1
"let g:deoplete#sources#go#json_directory = '~/tmp'

" molokai
syntax on
colorscheme molokai
highlight Normal ctermbg=none
let g:molokai_original = 1
let g:rehash256 = 1

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"LightLine
set laststatus=2
set encoding=utf-8
scriptencoding utf-8
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"x":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

"NERDTree
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
map  <C-k> :tabn<CR>
map  <C-j> :tabp<CR>
map  <C-n> :tabnew<CR>

" vim
set title
set noshowmode
set number
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" Enable filetype plugins
filetype plugin on

"autocmd VimEnter * execute 'NERDTree'
