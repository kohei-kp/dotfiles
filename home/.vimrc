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

"neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set runtimepath+=~/vim//bundle/vital.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

filetype plugin indent on

" Installation check:
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : '.
  \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" Plugins {{{
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/junkfile.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin'  : 'make -f make_cygwin.mak',
        \ 'mac'     : 'make -f make_mac.mak',
        \ 'unix'    : 'make -f make_unix.mak'
    \ },
\ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-datetime'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'osyo-manga/vim-textobj-blockwise'
NeoBundle 'osyo-manga/vim-operator-blockwise'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/calendar.vim'

NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'

NeoBundle 'mattn/emoji-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'

NeoBundle 'vim-jp/vital.vim'
NeoBundle 'L9'
NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'jQuery'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Simple-Javascript-Indenter'
NeoBundle 'elzr/vim-json'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'akiyan/vim-textobj-php'
NeoBundle 'taglist.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'haya14busa/incsearch.vim'

NeoBundle 'thinca/vim-scouter'

NeoBundleLazy 'supermomonga/jazzradio.vim', { 'depends' : [ 'Shougo/unite.vim' ] }
if neobundle#tap('jazzradio.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'unite_sources' : [
        \       'jazzradio'
        \     ],
        \     'commands' : [
        \       'jazzradioupdatechannels',
        \       'jazzradiostop',
        \       {
        \         'name' : 'jazzradioplay',
        \         'complete' : 'customlist,jazzradio#channel_id_complete'
        \       }
        \     ],
        \     'function_prefix' : 'jazzradio'
        \   }
        \ })
endif
" }}}

NeoBundle 'xsbeats/vim-blade'
NeoBundle 'kanchoku/tcvime'

call neobundle#end()

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

set undodir=$HOME.'.vim/undo'
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
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets, ~/.vim/mysnippets'

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

if has('keymap')
  set iminsert=0 imsearch=0
  " 切替時にインデントが解除されるのを回避するため、1<C-H>
  inoremap <C-J> 1<C-H><C-O>:call <SID>EnableKeymap('tcode')<CR>
  inoremap <silent> <C-L> 1<C-H><C-O>:call <SID>DisableKeymap()<CR>
  inoremap <silent> <ESC> <ESC>:set imsearch=0<CR>
  nnoremap <silent> <C-K>k <Plug>TcvimeNKatakana
  vnoremap <silent> <C-K>k <Plug>TcvimeVKatakana
endif

function! s:EnableKeymap(keymapname)
  call tcvime#SetKeymap(a:keymapname)
  " <Space>で前置型交ぜ書き変換を開始するか、読みが無ければ' 'を挿入。
  " (lmapにすると、lmap有効時にfやtやrの後の<Space>が使用不可。(<C-R>=なので))
  inoremap <silent> <Space> <Plug>TcvimeIConvOrSpace
endfunction

function! s:DisableKeymap()
  let &iminsert = 0
  silent! iunmap <Space>
  TcvimeCloseHelp
endfunction

" lmapのカスタマイズを行う関数。
" tcvime#SetKeymap()からコールバックされる。
function! TcvimeCustomKeymap()
  " tc2同様の後置型交ぜ書き変換を行うための設定:
  " 活用しない語
  lmap <silent> 18 <C-R>=tcvime#InputPostConvert(1, 0)<CR>
  lmap <silent> 28 <C-R>=tcvime#InputPostConvert(2, 0)<CR>
  lmap <silent> 38 <C-R>=tcvime#InputPostConvert(3, 0)<CR>
  lmap <silent> 48 <C-R>=tcvime#InputPostConvert(4, 0)<CR>
  " 活用する語(ただしtc2と違って、読みの文字数には活用語尾は含まない)
  lmap <silent> 29 <C-R>=tcvime#InputPostConvert(2, 1)<CR>
  lmap <silent> 39 <C-R>=tcvime#InputPostConvert(3, 1)<CR>
  lmap <silent> 49 <C-R>=tcvime#InputPostConvert(4, 1)<CR>
  lmap <silent> 59 <C-R>=tcvime#InputPostConvert(5, 1)<CR>
endfunction

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
"}}}
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
