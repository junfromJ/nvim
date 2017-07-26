set number

set noswapfile


" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set title
set ignorecase
set incsearch
set wrapscan
set history=200
set hlsearch
set nobackup
set laststatus=2
set wildmenu
set wildmode=full
set background=dark
syntax on
hi Visual guifg=White guibg=LightBlue gui=none

"VimBookによる便利な設定
cnoremap <expr> %% getcmdtype() == ':'?expand('%:h').'/':'%%'
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> {b :bnext<CR>
nnoremap <silent> ]b :bfirst<CR>
nnoremap <silent> }b :blast<CR>
nnoremap <silent> [N :NERDTree<CR>
nnoremap <silent> [gn :%s///gn<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> {c :cnext<CR>
nnoremap <silent> ]c :cfirst<CR>
nnoremap <silent> }c :clast<CR>

"選択範囲の検索設定
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>


"QuickRunの設定です
"let g:quickrun_config={'*': {'split': 'vertical'}}
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runner': 'vimproc'}
nnoremap <silent> [rr :QuickRun<CR>
set splitright


"かっこの自動入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"ctagsに関するアドリブ
nnoremap <silent> [wi :windo lcd 
" nnoremap <silent> [ct :!ctags -R<CR>

"保存設定ショートカット
nnoremap <silent> [ww :w!<CR>
nnoremap <silent> [ss :source ~/.vimrc<CR>
nnoremap <silent> [wq :wq!<CR>
nnoremap <silent> [qq :q!<CR>
nnoremap <silent> [xx :x!<CR>

"ctags(VimBook)
" autocmd BufWritePost * call system("ctags -R")

"VimBookの便利な設定です
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
"&コマンドの修正
nnoremap & :&&<CR>
xnoremap & :&&<CR>
"ハイライト無効化
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"autocmd vimenter * NERDTree
"let NERDTreeWinSize=23

" ColorSchemeの設定です
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
set termguicolors

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
		
  call dein#add('scrooloose/nerdtree')
  call dein#add('thinca/vim-quickrun')
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOMLを読み込みキャッシュしておく
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})


  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

syntax enable
colorscheme tender
