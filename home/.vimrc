" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

" init autocmd
augroup myGroup
  autocmd!
augroup END

" Startup time
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup myGroup
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
    \ | echomsg 'Time:'. reltimestr(g:startuptime)
  augroup END
endif

" VimPlug
call plug#begin('~/.vim/plugged')

  Plug 'thinca/vim-quickrun'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-datetime'
  Plug 'kana/vim-operator-replace'
  Plug 'kana/vim-operator-user'
  Plug 'osyo-manga/vim-anzu'
  Plug 'osyo-manga/vim-textobj-blockwise'
  Plug 'osyo-manga/vim-operator-blockwise'
  Plug 'osyo-manga/vim-watchdogs'
  Plug 'itchyny/lightline.vim'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/clever-f.vim'
  Plug 'posva/vim-vue'
  Plug 'fatih/vim-go'
  Plug 'w0rp/ale'

  Plug 'lilydjwg/colorizer'
  Plug 'cocopon/lightline-hybrid.vim'
  Plug 'cocopon/vaffle.vim'


  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

  "Plug 'prettier/vim-prettier', {
  "  \ 'do': 'yarn install',
  "  \ 'branch': 'release/1.x',
  "  \ 'for': [
  "  \ 'javascript',
  "  \ 'typescript',
  "  \ 'css',
  "  \ 'less',
  "  \ 'scss',
  "  \ 'json',
  "  \ 'graphql',
  "  \ 'markdown',
  "  \ 'vue',
  "  \ 'lua',
  "  \ 'php',
  "  \ 'python',
  "  \ 'ruby',
  "  \ 'html',
  "  \ 'swift' ] }

  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'othree/javascript-libraries-syntax.vim'

  " colorscheme
  Plug 'cocopon/iceberg.vim'
  Plug 'w0ng/vim-hybrid'
  Plug 'sainnhe/vim-color-atlantis'

call plug#end()

filetype plugin indent on

" option settings {{{
syntax on
colorscheme iceberg

set autoindent " 新しい行のインデントを現在行と同じにする
set smartindent " 新しい行を作った際に高度な自動インデントを行う
set expandtab " 空白を使う
set tabstop=4
set shiftwidth=4
set softtabstop=4 " <TAB>で挿入される空白数
set smarttab 

set clipboard=unnamed " クリップボード連携

set noswapfile " スワップファイルを作らない
set nobackup " バックアップファイルを作らない

set hidden " 変更中のファイルでも、保存しないで他のファイルを表示

set number " 行番号の表示

set incsearch " インクリメンタルサーチ
set hlsearch " 検索文字を強調
set ignorecase " 大文字小文字を区別しない
set smartcase " 大文字小文字を含んでいる際は区別
set wrapscan " 検索時にファイルの最後まで行ったら最初に戻る
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f " grep検索の設定
set grepprg=grep\ -nh

set title " タイトル表示

set display=lastline " できるだけ最後まで表示

set mouse=a " ターミナルでマウスを使用できるように
set guioptions+=a
set ttymouse=xterm2

set list " 不可視文字の視覚化
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%

"文字コードと改行コードの表示
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2
set showtabline=2

" 音を鳴らさない
set noerrorbells
set vb t_vb=

set nrformats=alpha " アルファベット<C-a><C-x>でアルファベットを進められるように

set matchpairs& matchpairs+=<:> " <>をマッチパターンに加える

set background=dark

set noundofile

set autowrite

set splitright

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  "autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" }}}

" mappings {{{
nnoremap ; :

" 分割画面の移動
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" 横分割と縦分割(新バッファ)
nnoremap <silent>,vn :vnew<CR>
nnoremap <silent>,en :enew<CR>

" 移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <silent><Space>h ^
nnoremap <silent><Space>l $

cnoremap <C-l> <Right>
cnoremap <C-h> <Left>

vnoremap < <gv
vnoremap > >gv

"Shift + Enterで改行して行頭削除(自動コメント挿入を消す)
inoremap <S-CR> <CR><C-u>
nnoremap <S-CR> o<C-u>
nnoremap <C-z> <CR><C-u>
inoremap <C-z> <CR><C-u>

nnoremap <silent>,tn :tabnext<CR>
nnoremap <silent>,tt :tabnew<CR>
nnoremap <C-TAB> gt
nnoremap <C-S-TAB> gT

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

inoremap <C-d><C-d> $this->
"}}}

"現在開いているディレクトリをルートディレクトリにする
command! Cd :cd %:h

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vim anzu
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
" 一定時間キー入力がないとき、ウインドウ・タブを移動したときに検索ヒット数の表示を消去する
  autocmd!
  autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status() 
augroup END

" ale
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" lightline settings
let g:lightline = {
    \ 'colorscheme': 'iceberg',
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive','filename' ], ['anzu'], ['ale'] ]
    \ },
    \ 'component_function': {
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadonly',
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'mode': 'MyMode',
    \   'anzu': 'anzu#search_status',
    \   'ale': 'ALEStatus'
    \ }
    \ }
let g:lightline.tabline = {
    \ 'colorscheme': 'hybrid'
    \}

function! MyModified()
  return &ft =~ 'help|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return fugitive#head()
endfunction
 
function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! ALEStatus()
  return LinterStatus()
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
  \)
endfunction

"operator-replace
map _ <Plug>(operator-replace)

nnoremap <Leader>/ /

"vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" augroup {{{
augroup myGroup
  autocmd FileType javascript,vue call s:javascript_filetype_settings()
  autocmd FileType html call s:html_filetype_settings()
  autocmd FileType css  call s:css_filetype_settings()
  autocmd FileType less call s:css_filetype_settings()
  autocmd FileType vim call s:vim_filetype_settings()
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.json,*jsonp,*.geojson,*.topojson set filetype=json
  autocmd BufNewFile,BufRead *.tag setlocal ft=javascript
  autocmd FileType go call s:go_filetype_settings()
augroup END
" }}}
function! s:javascript_filetype_settings()
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction

" html
function! s:html_filetype_settings()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal includeexpr=substitute(v:fname,'^\\/','','') |
endfunction

" css
function! s:css_filetype_settings()
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction

" vim
function! s:vim_filetype_settings()
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction

" go
function! s:go_filetype_settings()
  nmap <Leader>b <Plug>(go-build)
  nmap <Leader>r <Plug>(go-run)
endfunction

" vnewしたあと、指定ファイルタイプに変更
function! s:setFileTypeForNewBuf(file_type)
  vnew
  execut 'set filetype='. a:file_type
endfunction
command! -nargs=1 SetFileTypeForNewBuf :call s:setFileTypeForNewBuf(<f-args>)
nnoremap ,sf :SetFileTypeForNewBuf 
" }}}

" インクリメント、デクリメント
nnoremap + <C-A>
nnoremap - <C-X>

" vim-prettier
" when running at every change you may want to disable quickfix
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Vaffle
nnoremap ,f :Vaffle<CR>

let g:vaffle_auto_cd=1
let g:vaffle_open_selected_vsplit_position='rightbelow'


" coc.nvim
nmap <silent> ,d <Plug>(coc-definition)
nmap <silent> ,y <Plug>(coc-type-definition)
nmap <silent> ,i <Plug>(coc-implementation)
nmap <silent> ,r <Plug>(coc-references)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" vim: set foldmethod=marker:
