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

if &compatible
  set nocompatible               " Be iMproved
endif

"neobundle
if has('vim_starting')
  set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim/
  set runtimepath+=~/vim/dein/repos/github.com/vim-jp/vital.vim/
endif

call dein#begin(expand('.vim/dein'))

" dein {{{
" Let dein manage dein
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/junkfile.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimproc.vim', { 'build': 'make' })

call dein#add('thinca/vim-quickrun')
call dein#add('thinca/vim-ref')

call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-entire')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-function')
call dein#add('kana/vim-textobj-line')
call dein#add('kana/vim-textobj-datetime')
call dein#add('kana/vim-operator-replace')
call dein#add('kana/vim-operator-user')

call dein#add('osyo-manga/vim-anzu')
call dein#add('osyo-manga/vim-textobj-blockwise')
call dein#add('osyo-manga/vim-operator-blockwise')

call dein#add('itchyny/lightline.vim')
call dein#add('itchyny/calendar.vim')

call dein#add('mattn/webapi-vim')
call dein#add('mattn/emmet-vim')

call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-markdown')
call dein#add('vim-jp/vital.vim')
call dein#add('L9')
call dein#add('rhysd/clever-f.vim')
call dein#add('vim-scripts/sudo.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('davidhalter/jedi-vim')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('jQuery')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('w0ng/vim-hybrid')
call dein#add('Simple-Javascript-Indenter')
call dein#add('elzr/vim-json')
call dein#add('lilydjwg/colorizer')
call dein#add('akiyan/vim-textobj-php')
call dein#add('taglist.vim')
call dein#add('cocopon/lightline-hybrid.vim')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('kchmck/vim-coffee-script')

call dein#add('haya14busa/incsearch.vim')

call dein#add('thinca/vim-scouter')

call dein#add('kana/vim-filetype-haskell')
call dein#add('eagletmt/ghcmod-vim')
call dein#add('ujihisa/neco-ghc')
call dein#add('ujihisa/ref-hoogle')
call dein#add('ujihisa/unite-haskellimport')
call dein#add('osyo-manga/vim-watchdogs')

" }}}

call dein#end()

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
filetype plugin indent on

" option settings {{{
syntax on
colorscheme hybrid

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

set showtabline=2

" 音を鳴らさない
set noerrorbells
set vb t_vb=

set nrformats=alpha " アルファベット<C-a><C-x>でアルファベットを進められるように

set matchpairs& matchpairs+=<:> " <>をマッチパターンに加える

set background=dark

set noundofile
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
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>] %

cnoremap <C-l> <Right>
cnoremap <C-h> <Left>

vnoremap < <gv
vnoremap > >gv

"Shift + Enterで改行して行頭削除(自動コメント挿入を消す)
inoremap <S-CR> <CR><C-u>
nnoremap <S-CR> o<C-u>

nnoremap <silent>,tn :tabnext<CR>
nnoremap <silent>,tt :tabnew<CR>

nnoremap <C-TAB> gt
nnoremap <C-S-TAB> gT

nnoremap <F1> :e $MYVIMRC<CR>
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <F6> :source $MYGIVIMRC<CR>

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" コピー系
"nnoremap <silent>,p "0p

" PHP用?
inoremap <C-d> $
inoremap <C-d><C-d> $this->
"}}}

"現在開いているディレクトリをルートディレクトリにする
command! Cd :cd %:h

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplcache_max_list = 20
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#disable_auto_complete = 0
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_insert_char_pre = 1
set completeopt& completeopt-=preview

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default':    '',
    \ 'vimshell':   $HOME .    '/.vimshell_hist',
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" jedi neocomplete 連携
let g:jedi#auto_vim_configuration = 0

if !exists('neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" jediメソッド定義をオフ
let g:jedi#show_call_signatures = 0
" .で自動補完しない
let g:jedi#popup_on_dot = 0

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

" SimpleJsIndenter
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" unite
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" open-browser
nmap <Leader>w <Plug>(openbrowser-smart-search)

" tweetvim
"let g:tweetvim_display_icon = 1
nnoremap <silent> ,tl :TweetVimHomeTimeline<CR>
nnoremap <silent> ,ts :TweetVimSay<CR>
nnoremap <silent> ,tu :TweetVimUserTimeline lisia__<CR>

" vimshell
nnoremap <silent> ,s :VimShell<CR>

" vimFiler
nnoremap <silent> ,f :VimFiler<CR>

"neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ?
\ "\<C-n>" : neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
\"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell neosnippet about th other snippets
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/vim-snippets/snippets, ~/.vim/mysnippets'

" lightline settings
let g:lightline = {
    \ 'colorscheme': 'hybrid',
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive','filename' ],['anzu'] ]
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
    \   'anzu': 'anzu#search_status'
    \ }
    \ }

let g:lightline.tabline = {
    \ 'colorscheme': 'hybrid'
    \}

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
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

" SimpleJsIndenter
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,angularjs,angularui'

" easy motion copy
" =======================================
" Boost your productivity with EasyMotion
" =======================================
" Disable default mappings
" If you are true vimmer, you should explicitly map keys by yourself.
" Do not rely on default bidings.
let g:EasyMotion_do_mapping = 0

" Or map prefix key at least(Default: <Leader><Leader>)
" map <Leader> <Plug>(easymotion-prefix)

" =======================================
" Find Motions
" =======================================
" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
" Of course, you can map to any key you want such as `<Space>`
" map <Space>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" =======================================
" Line Motions
" =======================================
" `JK` Motions: Extend line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0

" =======================================
" General Configuration
" =======================================
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

" =======================================
" Search Motions
" =======================================
" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)

"operator-replace
map _ <Plug>(operator-replace)


" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

nnoremap <Leader>/ /

" augroup {{{
augroup myGroup
  autocmd FileType javascript call s:javascript_filetype_settings()
  autocmd FileType html call s:html_filetype_settings()
  autocmd FileType css  call s:css_filetype_settings()
  autocmd FileType less call s:css_filetype_settings()
  autocmd FileType vim call s:vim_filetype_settings()
  autocmd FileType python call s:py_filetype_settings()
  autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.json,*jsonp,*.geojson,*.topojson set filetype=json
  autocmd BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
  autocmd FileType coffee call s:coffee_filetype_settings()
  autocmd BufRead,BufNewFile,BufReadpre *.blade.php set filetype=blade
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

" py
function! s:py_filetype_settings()
  setlocal omnifunc=jedi#completions
endfunction

" coffee
function! s:coffee_filetype_settings()
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction

" functions
" 地名から緯度経度を取得-> :messageに残るように, clipboardにも入れる
function! s:getLonLat(address)
  let url = 'http://maps.googleapis.com/maps/api/geocode'
  let parameter = 'address='. a:address.'&sensor=false'
  "use webapi-vim
  let res = webapi#http#get(url. '/json?'. parameter)

  if res.status !~"^2.*"
    echo ['error', 'Failed']
    return 0
  endif

  let content = webapi#json#decode(res.content)
  let results = content.results
  let location = results[0].geometry.location
  let dict = {'Lon': string(location.lng), 'Lat': string(location.lat)}

  let str = a:address. ' Lon:' . dict.Lon . ' | Lat:' . dict.Lat
  echomsg str

  let lonlat = dict.Lon . ', ' . dict.Lat
  call setreg(v:register, lonlat)

  " ファイルに書き込む
  let outputfile = '$HOME/lonlats.txt'
  execute ':redir! >> ' . outputfile
    silent! echo str
  redir END
  "call writefile(str, outputfile)

  "echo readfile($HOME . '/lonlats.txt')
endfunction
command! -nargs=1 GetLonLat :call s:getLonLat(<f-args>)
nnoremap ,ll :GetLonLat 

" vnewしたあと、指定ファイルタイプに変更
function! s:setFileTypeForNewBuf(file_type)
  vnew
  execut 'set filetype='. a:file_type
endfunction
command! -nargs=1 SetFileTypeForNewBuf :call s:setFileTypeForNewBuf(<f-args>)
nnoremap ,sf :SetFileTypeForNewBuf 

" unite source sample {{{
let s:source = {
\ 'name': 'lonlats',
\ 'description': 'example unite lonlats',
\ }

function! s:source.gather_candidates(args, context)
  " lonlats.txt内容取得
  let file_content = readfile($HOME . '/lonlats.txt')

  " 表示する
  return map(copy(file_content), '{
  \ "word": v:val,
  \ "kind": "word",
  \ }')
endfunction

call unite#define_source(s:source)
unlet s:source
" }}}

" インクリメント、デクリメント
nnoremap + <C-A>
nnoremap - <C-X>

" vim: set foldmethod=marker:
