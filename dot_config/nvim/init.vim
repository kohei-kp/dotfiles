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

set redrawtime=8000

" Startup time
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup myGroup
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
    \ | echomsg 'Time:'. reltimestr(g:startuptime)
  augroup END

  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
  let &t_te .= "\e[0 q"
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
  Plug 'cocopon/lightline-hybrid.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'lambdalisue/vim-quickrun-neovim-job'
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  if !exists('g:vscode')
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'neoclide/coc.nvim', {'branch': 'release' }
    Plug 'github/copilot.vim'
  endif

  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

  " colorscheme
  Plug 'cocopon/iceberg.vim'
  Plug 'w0ng/vim-hybrid'
  Plug 'arcticicestudio/nord-vim'
  Plug 'haishanh/night-owl.vim'
  Plug 'Rigellute/rigel'
  Plug 'sainnhe/everforest'

call plug#end()

filetype plugin indent on

" option settings {{{
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
    hi Cursor guifg=black guibg=red
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
endif

syntax enable
colorscheme everforest
set background=dark

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
"set ttymouse=xterm2

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


set noundofile

set autowrite

set splitright

set backspace=indent,eol,start

set showmatch
set matchtime=1

set foldmethod=indent
set foldlevel=99


augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  "autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" highlight ALEError ctermbg=DarkRed
" highlight ALEWarning ctermbg=DarkYellow
" " hi MatchParen ctermbg=darkgreen
" hi Normal ctermbg=NONE guibg=NONE
" hi NonText ctermbg=NONE guibg=NONE
" hi SpecialKey ctermbg=NONE guibg=NONE
" hi EndOfBuffer ctermbg=NONE guibg=NONE
hi Comment gui=NONE
hi SpecialComment gui=NONE
" set guicursor=
" net loaded_matchparen = 1
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

" インクリメント、デクリメント
nnoremap + <C-A>
nnoremap - <C-X>

function! s:grep(word) abort
  cgetexpr system(printf('ag "%s"', a:word)) | cw
endfunction

command! -nargs=1 Grep :call <SID>grep(<q-args>)

command! -nargs=0 OpenInitVim :call <SID>open_init_vim()
function! s:open_init_vim() abort
  execute 'edit' $MYVIMRC
endfunction

" augroup {{{
augroup myGroup
  autocmd FileType javascript,vue,typescript,typescriptreact,react call s:javascript_filetype_settings()
  autocmd FileType html call s:html_filetype_settings()
  autocmd FileType css,scss,less call s:css_filetype_settings()
  autocmd FileType vim call s:vim_filetype_settings()
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.json,*jsonp,*.geojson,*.topojson set filetype=json
  autocmd BufNewFile,BufRead *.tag setlocal ft=javascript
  autocmd FileType go call s:go_filetype_settings()
  autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
  autocmd BufWritePost $MYVIMRC source % | call lightline#enable()
  autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup END
" }}}
"
"

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

" Plugin settings
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
let g:ale_use_global_executables = 1
" lightline settings
let g:lightline = {
    \ 'colorscheme': 'everforest',
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b0", 'right': "\ue0b3" },
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
    \ 'colorscheme': 'everforest'
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
  return FugitiveHead()
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

" Fern
let g:fern#default_hidden = 1
nnoremap <silent> ,f :Fern . -reveal=% -drawer -toggle -width=40<CR>

" coc.nvim
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists', 'coc-phpls', 'coc-jedi', 'coc-diagnostic', 'coc-rust-analyzer', 'coc-php-cs-fixer']

nmap <silent> ,d <Plug>(coc-definition)
nmap <silent> ,y <Plug>(coc-type-definition)
nmap <silent> ,i <Plug>(coc-implementation)
nmap <silent> ,r <Plug>(coc-references)
nmap <silent> ,re <Plug>(coc-rename)


command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 PHPSCSFixer :call CocAction('runCommand', 'php-cs-fixer.fix')

function! s:CheckAndRunPint()
  " 一時ファイルに保存して構文チェック
  let l:tempfile = tempname() . '.php'
  execute 'write! ' . l:tempfile
  if system('php -l ' . l:tempfile) =~ 'No syntax errors detected'
    call CocAction('runCommand', 'php-cs-fixer.pintFix')
  else
    echo "Syntax error detected. Pint was not run."
  endif
  " 一時ファイルの削除
  call delete(l:tempfile)
endfunction

command! -nargs=0 Pint call s:CheckAndRunPint()

"Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    excute 'h '.expand('<cword>')
  elseif coc#rpc#ready()
    call CocActionAsync('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr><CR> coc#pum#visible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr><C-Space> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]

"" fzf-preview
let $BAT_THEME                     = 'gruvbox-dark'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'

nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
nnoremap <silent> [ff]s  :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [ff]gg :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [ff]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [ff]r  :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap          [ff]f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>
xnoremap          [ff]f  "sy:CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

nnoremap <silent> [ff]q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> [ff]rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> [ff]d  :<C-u>CocCommand fzf-preview.CocDefinition<CR>
nnoremap <silent> [ff]t  :<C-u>CocCommand fzf-preview.CocTypeDefinition<CR>
nnoremap <silent> [ff]o  :<C-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>

" vim-vue
let g:vue_pre_processors = []


" indent-guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=green
hi IndentGuidesEven ctermbg=green

" quickrun
"
"
"
let g:quickrun_config = {'_': {}}

if has('nvim')
  " Use 'neovim_job' in Neovim
  let g:quickrun_config._.runner = 'neovim_job'
elseif exists('*ch_close_in')
  " Use 'job' in Vim which support job feature
  let g:quickrun_config._.runner = 'job'
endif

" Copilot.vim
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

if !exists('g:vscode')
lua << EOF
-- configure treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "html" },  -- list of language that will be disabled
  },
}
EOF
endif

lua << EOF
-- indent blankline
require'ibl'.setup {
  scope = {
    enabled = true,
    show_start = true,
  },
  indent = {
    char = '│',
  }
}

require'colorizer'.setup()

require("toggleterm").setup()
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit -ucd ~/.config/lazygit",
  direction = "float",
  hidden = true
})

function _lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

local floatTerm = Terminal:new({
  direction = "float",
  hidden = true
})
function _floatTerm_toggle()
  floatTerm:toggle()
end
vim.api.nvim_set_keymap("n", "tt", "<cmd>lua _floatTerm_toggle()<CR>", { noremap = true, silent = true })
EOF
