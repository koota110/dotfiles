"          __
"  __  __ /\_\    ___ ___   _ __   ___
" /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
" \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"  \ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"   \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/

" vimrcでマルチバイト文字を使用しているため設定 {{{
scriptencoding utf-8
" }}}

"folding setting
augroup folding
  autocmd!
  au BufWinLeave * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
  au BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
  au BufWinEnter * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
augroup END

au BufNewFile,BufRead *.golden setf json 
autocmd! VimEnter  * :mksession!

"
" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

" }}}

" general settings {{{

" ミュート {{{
set belloff=all
" }}}

" 文字コード {{{
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
" }}}

" Leaderキーをスペースに設定 {{{
let g:mapleader = "\<Space>"
" }}}

" シンタックスを有効にする {{{
syntax enable
" }}}

" カラースキームを使う {{{
colorscheme iceberg
" }}}

" ファイル形式別プラグインとインデントを有効にする {{{
filetype plugin indent on
" }}}

" バックスペースとCtrl+hで削除を有効にする {{{
set backspace=2 " }}}

" 改行時自動インデント {{{
set smartindent
set autoindent
" }}}

" 自動インデントの空白の数
"set shiftwidth=2
" }}}

" 行番号を表示 {{{
set number
" }}}

" タブでも常に空白を挿入 {{{
"set tabstop=4
"set expandtab
" }}}

" インクリメントサーチを有効にする {{{
set incsearch
" }}}

" 検索時大文字小文字を区別しない {{{
set ignorecase
" }}}

" 検索時に大文字を入力した場合ignorecaseが無効になる {{{
set smartcase
" }}}

" ハイライトサーチを有効にする {{{
set hlsearch
" }}}

" undoできる最大数 {{{
set undolevels=1000
" }}}

" クリップボードを共有 {{{
if has("mac")
  set clipboard+=unnamed
else
  set clipboard^=unnamedplus
endif
" }}}

" カーソルが常に中央に来るようにする {{{
set scrolloff=100
" }}}

" マクロで効果発揮 {{{
set lazyredraw
set ttyfast
" }}}

" 一行が長いファイルをsyntaxを制御することで軽くする {{{
set synmaxcol=256
" }}}

" カーソルラインを表示する {{{
set cursorline
" 描画負担軽減のため、行番号のみハイライト
if !has('nvim')
  set cursorlineopt=number
endif
" }}}

" netrwツリー表示を有効にする {{{
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_sizestyle='H'
let g:netrw_timefmt='%Y/%m/%d(%a) %H:%M:%S'
" }}}
" j
" 拡張子ごとのインデント設定 {{{
augroup fileTypeIndent
  autocmd!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sql setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType fish setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType golden setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END
" }}}

" wildmenuを有効にする {{{
set wildmenu

function! s:fix(word) 
  let list=split(a:word,' ')
  execute("cdo :s/".list[0]."/".list[1]."/g")
endfunction
" }}}
command! -nargs=1 QuickFix call s:fix(<f-args>)
" grepした結果をquickfixに表示する {{{
augroup grepwindow
  au!
  au QuickFixCmdPost *grep* cwindow
augroup END
" }}}

" カーソルラインの位置を保存する {{{
augroup cursorlineRestore
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
augroup END
" }}}

" undoの保存先 {{{
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  " ディレクトリが存在しない場合は作成
  if !isdirectory(undo_path)
    call mkdir(undo_path, 'p')
  endif
  exe 'set undodir=' .. undo_path
  set undofile
endif
" }}}

" 矩形選択時に文字の無いところまで選択範囲を広げる {{{
set virtualedit=block
" }}}

" ヘルプの言語を日本語優先にする {{{
set helplang=ja
" }}}

" {{{ 他のバッファに移動する時に自動保存
set autowrite
" }}}

" ファイル保存時に整形する {{{
let s:format_targets = {
      \ 'javascript': '--use-tabs=false --single-quote=true %',
      \ 'html': '--use-tabs=false --single-quote=true %',
      \ 'css': '',
      \ 'json': '--tab',
      \ 'vue':  '--use-tabs=false --single-quote=true %',
      \ 'vim': '',
      \ 'java': '',
      \ }

" format function
function! Format() abort
  " if format target is not exsist, nothing to do
  if !has_key(s:format_targets, &ft)
    return
  endif

  let args = s:format_targets[&ft]
  let pos = getcurpos()

  " use js-beautify to format js, html, css
  if &ft is# 'javascript' || &ft is# 'html' || &ft is# 'vue'
    if executable('prettier')
      exe '%!prettier ' .. args
    else
      call s:echo_err("prettier doesn't installed, please refference the https://github.com/beautify-web/js-beautify")
    endif
  elseif &ft is# 'css'
    " TODO
  elseif &ft is# 'json'
    if executable('jq')
      exe "%!jq " .. args
    else
      call s:echo_err("jq doesn't installed, please refference the https://stedolan.github.io/jq/")
    endif
  else
    execute 'normal 1G=G'
  endif

  call setpos('.', pos)
endfunction

nnoremap <C-f> :call Format()<CR>:retab<CR>
" }}}

nnoremap <Leader>/ *
nnoremap <silent>dc :DockerCompose up -d<CR>

" プラグインディレクトリ配下の.vimをすべてsourceする {{{
function! SourceDir(...) abort
  let l:path = getcwd()
  if a:0 > 1
    let l:path = a:1
  endif

  if !isdirectory(l:path)
    return
  endif

  exe 'set rtp^=' . l:path
  if isdirectory(l:path . '/plugin')
    exe 'runtime plugin/*.vim'
  endif

  if isdirectory(l:path . '/autoload')
    exe 'runtime autoload/*.vim'
  endif

  if isdirectory(l:path . '/syntax')
    exe 'runtime syntax/*.vim'
  endif
endfunction

command! -nargs=* Source call SourceDir(<f-args>)
" }}}

" listの設定 {{{
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" }}}

" {{{ 行末のホワイトスペース削除
let s:spaces_target_ft = {
      \ 'markdown': 0,
      \ 'go': 1,
      \ 'javascript': 1,
      \ 'graphql': 1,
      \ 'terminal': 1,
      \ }
augroup HighlightTrailingSpaces
  autocmd!
  autocmd BufWritePre * if get(s:spaces_target_ft, &ft, 0) | :silent keeppatterns %s/\s\+$//ge | endif
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * if get(s:spaces_target_ft, &ft, 0) | match TrailingSpaces /\s\+$/ | endif
augroup END
" }}}

" swapファイルを作成しない
set noswapfile

" {{{ セッションで保存する対象を設定する
if !has('nvim')
  set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
endif
" }}}

" ウィンドウサイズ自動調整を無効化
"set noequalalways

" タブを常に表示
set showtabline=2

" 数値の加減算を考慮
if has('patch-8.2.0860')
  setglobal nrformats+=unsigned
endif

" {{{ 外部でファイルの変更があった場合、自動的に読み直す
set autoread
augroup vimrc-misc
  au!
  autocmd WinEnter,FocusGained * checktime
augroup END
" }}}

" key mappings {{{

" fern
nnoremap <silent> <Leader>f :Fern . -drawer<CR>
augroup fern-setteings
  autocmd! *
  autocmd FileType fern nnoremap <silent> q ::bw!<CR>
augroup END

"Dockerコンテナ一覧を開く
nnoremap <silent> <C-b> :DockerContainers<CR>
tnoremap <silent> <C-b> <C-w>:DockerContainers<CR>
tnoremap <C-n> <C-w>N

" *でカーソルを移動しないようにする    
command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, :erm_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/3 })
noremap * *N

" ファイル保存と終了 {{{
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
inoremap <C-y> <Esc>:w<CR>i
inoremap <C-q> :q!<CR>
" }}}

" 検索
nnoremap <C-G><C-G> :Ggrep <C-R><C-W><CR><CR>
nnoremap <expr> gr ':Rgrep --color=auto<CR>'
let Grep_Skip_Dirs = '.svn .git node_modules dist'  "無視するディレクトリ
let Grep_Options = '-I -i --color=auto'   "バイナルファイルがgrepしない
let Grep_Skip_Files = '*.bak *~ yarn.lock package.json package-lock.json *.log'  "バックアップファイルを無視する
nnoremap <expr> fs ':Rgrep -l<CR>'
" 置換k
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;

" ハイライトを削除する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" vimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

" テキストオブジェクトキーマッピング {{{
onoremap 8 i(
onoremap 2 i"
onoremap 7 i'
onoremap @ i`
onoremap [ i[
onoremap { i{

onoremap a8 a(
onoremap a2 a"
onoremap a7 a'
onoremap a@ a`
onoremap a[ a[
onoremap a{ a{

" visual
nnoremap v8 vi(
nnoremap v2 vi"
nnoremap v7 vi'
nnoremap v@ vi`
nnoremap v[ vi[
nnoremap v{ vi{

nnoremap va8 va(
nnoremap va2 va"
nnoremap va7 va'
nnoremap va@ va`
nnoremap va[ va[
nnoremap va{ va{
" }}}

" 行先頭と行末
noremap H ^
noremap L g_

" タブ切り替え
nnoremap <C-l> gt
nnoremap <C-h> gT

" numberとrelativenumberの切り替え
nnoremap <silent> <Leader>n :set relativenumber!<CR>

" ターミナル関連 {{{
" ターミナルノーマルモード
tnoremap <C-w>n <C-w>N

" ターミナルでウィンドウ移動
"tnoremap <silent> <C-l> <C-w>:tabnext<CR>
"tnoremap <silent> <C-h> <C-w>:tabprevious<CR>

" タブ移動
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>

" <c-g>を<c-w>代わりにする
"tnoremap <C-g> <C-w>.

" review
augroup review
  au!
  au FileType review vnoremap <silent> <buffer> <Leader>hi c@<cursor>{<c-r>"}<esc>
augroup END

" 改行
nnoremap <C-j> o<ESC>
nnoremap <C-k> O<ESC>
nnoremap o A<CR>

" 挿入モードでのカーソル移動
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-e> <Esc>A
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-a> <Esc>I
" 囲う
nnoremap <silent> gw[ cw``<Esc>P
vnoremap <silent> gw[ c``<Esc>P

" gina
nnoremap <silent> gs :Gina status<CR>
nnoremap <silent> gl :Gina log<CR>
call gina#custom#mapping#nmap(
      \ 'status', '<C-j>',
      \ '--j',
      \ { 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'gf',
      \ '<Plug>(gina-edit-tab)',
      \ { 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'gp',
      \ ':<C-u>Gina push<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'cm',
      \ ':<C-u>Gina commit<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'ca',
      \ ':<C-u>Gina commit --amend<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'dp',
      \ '<Plug>(gina-patch-oneside-tab)',
      \ {'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'q',
      \ ':<C-u>bw!<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'ga',
      \ '--',
      \ {'silent': 1},
      \)
call gina#custom#mapping#vmap(
      \ 'status', 'ga',
      \ '--',
      \ {'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'status', 'gd',
      \ '==',
      \ {'silent': 1},
      \)
call gina#custom#mapping#vmap(
      \ 'status', 'gd',
      \ '==',
      \ {'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'log', 'q',
      \ ':<C-u>bw!<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'log', 'dd',
      \ '<Plug>(gina-changes-of)',
      \ {'silent': 1},
      \)
call gina#custom#mapping#nmap(
      \ 'changes', 'q',
      \ ':<C-u>bw!<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)

" バッファ一覧
nnoremap gb :Buffers<CR>
" ヘルプ
augroup help-mapping
  au!
  au FileType help nnoremap <buffer> <silent>q :bw!<CR>
augroup END

" }}}

" コマンドラインで単語移動 {{{
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-a> <Home>
" }}}

" vim-go settings {{{
" ファイル保存時go importを実行する
let g:go_fmt_command = 'goimports'

" goplsを有効化
let g:go_gopls_enabled = 0
let g:go_referrers_mode = 'guru'

" ファイル保存時、linterを実行する
"let g:go_metalinter_autosave = 1

" linter実行時、go vetのみを実行する
"let g:go_metalinter_autosave_enabled = ['vet']

" golangci-lintを使う
"let g:go_metalinter_command = "golangci-lint"

" vim-lspを使用するので、vim-goの`Ctrl+]`を無効にする
let g:go_def_mapping_enabled = 0

" GoDocでポップアップウィンドウを使用する
"let g:go_doc_popup_window = 1

" GoRunやGoTest時の画面分割方法変更
let g:go_term_mode = 'split'

" テンプレート作成を無効化
let g:go_template_autocreate = 0

" すでに開いているバッファに定義ジャンプする
let g:go_def_reuse_buffer = 1

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

" key mapping
"augroup goMapping
"    autocmd!
"    au FileType go set foldmethod=syntax
"augroup END
" }}}

" fzf settings {{{
" ファイル一覧を出すときにプレビュー表示
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <C-P> :Files<CR>
inoremap <C-P> <Esc>:Files<CR>i
" }}}

" lsp settings {{{

" lsp log
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  set completeopt^=popup
  nmap <Leader>ho <plug>(lsp-hover)
  nnoremap <silent> <C-]> :LspDefinition<CR>

  " enable signs
  let g:lsp_signs_error = {'text': 'ｳﾎ'}
  let g:lsp_signs_warning = {'text': '🍌'}
  let g:lsp_signs_enabled = 1
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" }}}

" vim-markdown settings {{{
" mdを開くときの折りたたみを無効にする
let g:vim_markdown_folding_disabled = 1
" }}}

" vim-surround settings {{{
nmap <Leader>7 ysiw'
nmap <Leader>2 ysiw"
nmap <Leader>` ysiw`
nmap <Leader>8 ysiw)
nmap <Leader>[ ysiw]
nmap <Leader>{ ysiw}
let g:surround_no_insert_mappings=1
" }}}

" profiling {{{
" vim +'call ProfileCursorMove()' <カーソルを動かすのが重いファイル>
function! ProfileCursorMove() abort
  let profile_file = expand('./vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! ggzR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(1000)
    call feedkeys('j')
  endfor
endfunction
" }}}

" emmet {{{
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
      \   'variables': {
      \     'lang' : 'ja'
      \   }
      \ }
"let g:user_emmet_leader_key = '<C-g>'

augroup emmet
  autocmd!
  au FileType vue,html,javascript,css EmmetInstall
  au FileType vue,html,javascript,css imap <buffer> <C-l> <plug>(emmet-expand-abbr)
augroup END
" }}}

" vim-vue {{{
" https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly
" vueファイルのシンタックスが効かなくなる問題対応
augroup VueSyntax
  autocmd!
  au FileType vue syntax sync fromstart
augroup END
" }}}

" sonictemplate.vim {{{
let g:sonictemplate_author = 'skanehira'
let g:sonictemplate_license = 'MIT'
let g:sonictemplate_vim_template_dir = expand('~/.vim/sonictemplate')
imap <silent> <C-l> <plug>(sonictemplate-postfix)
" }}}

" vimhelpgenarator {{{
let g:vimhelpgenerator_version = ''
let g:vimhelpgenerator_defaultlanguage = 'en'
" {{{ MemoList
let g:memolist_fzf = 1
" }}}

" {{{ lexima
let g:lexima_enable_basic_rules = 1
" }}}

" {{{ docker.vim
let g:docker_terminal_open = 'vert'
"let s:docker_auth_file = expand('~/.docker/docker.vim.json')
"let g:docker_registry_auth = json_decode(join(readfile(s:docker_auth_file), "\n"))
" }}}

" {{{ preview.vim
let g:previm_open_cmd = 'open'
" }}}

" {{{ gofmtmd
let g:gofmtmd_auto_fmt = 0
" }}}

" {{{ preview-markdown.vim
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
let g:preview_markdown_parser = 'mdr'
" }}}

" {{{ vista
let g:vista_default_executive = 'vim_lsp'
" }}}

"{{{ gist-vim
let g:gist_post_private = 1
let g:gist_list_vsplit = 1
"}}}

" {{{ 自作関数

" {{{ リポジトリに移動
function! s:cd_repo(shell, repo) abort
  exe 'lcd' trim(system('ghq root')) .. '/' .. a:repo
  pwd
endfunction

function! s:repo(multi, cb) abort
  if executable('ghq') && exists('*fzf#run()') && executable('fzf')
    call fzf#run({
          \ 'source': systemlist('ghq list'),
          \ 'sink': a:cb,
          \ 'options': a:multi,
          \ 'down': '40%'},
          \ )
  else
    echo "doesn't installed ghq or fzf.vim(require fzf)"
  endif
endfunction

command! Repo call s:repo('+m', function('s:cd_repo', [&shell]))
" }}}

" 新しいタブを開く {{{
function! s:open_tabs(shell, repo) abort
  exe printf('tabnew | lcd %s/%s', trim(system('ghq root')), a:repo)
endfunction

" fzf.vimのcallbackでは&shellがshになってしまうので、現在実行しているshellを渡す
command! NewTab call s:repo('-m', function('s:open_tabs', [&shell]))

" }}}

" {{{ エラーメッセージ出力
function! s:echo_err(message) abort
  echohl ErrorMsg
  redraw
  echo a:message
  echohl None
endfunction
" }}}

" {{{ gitコマンド関連
" options:
" {
" cmd: 'diff'
" args: [
"   'HEAD^',
" ],
" auto_close: 0,  " 1: true, 0: false
" window_way: 'bo', " tab, bo, vert, term, etc...
" mode: 'term', " term, popup, fzf
" focus: 1008, " window id
" source: [], " fzf source
" cb: functionm "fzf callback
" }
function! s:git_exec(opt) abort
  let current_winid = win_getid()
  if a:opt.mode is# 'term'
    let cmd = 'git ' .. a:opt.cmd
    if has_key(a:opt, 'args') && !empty(a:opt.args)
      let cmd = cmd .. ' ' .. join(a:opt.args, ' ')
    endif
    if has_key(a:opt, 'auto_close') && a:opt.auto_close is# 1
      let cmd = a:opt.window_way .. ' term ++rows=10 ++close ' .. cmd
    else
      let cmd = a:opt.window_way .. ' term ++rows=10 ' .. cmd
    endif
    exec cmd
    nnoremap <buffer> <silent> q :bw!<CR>
  elseif a:opt.mode is# 'pop'
    " TODO use popup window
  elseif a:opt.mode is# 'fzf'
    if exists('*fzf#run()') && executable('fzf')
      call fzf#run({
            \ 'source': a:opt.source,
            \ 'sink': a:opt.cb,
            \ 'down': '40%'},
            \ )
    endif
  else
    call s:echo_err("doesn't installed fzf.vim(require fzf)")
  endif

  call win_gotoid(current_winid)
endfunction

function! s:git_log() abort
  " use fish command
  call system('tmux new-window git log')
endfunction

function! s:git_push(...) abort
  let opt = {
        \ 'cmd': 'push',
        \ 'args': a:000,
        \ 'auto_close': 1,
        \ 'window_way': 'top',
        \ 'mode': 'term',
        \ }

  call s:git_exec(opt)
endfunction

function! s:git_pull(...) abort
  let opt = {
        \ 'cmd': 'pull',
        \ 'args': a:000,
        \ 'auto_close': 1,
        \ 'window_way': 'top',
        \ 'mode': 'term',
        \ }

  call s:git_exec(opt)
endfunction

function! s:git_checkout_cb(repo) abort
  let list = split(a:repo,'/')
  let last = remove(list, -1)
  let length = len(list) 
  if length == 0 
    call system('git checkout' .. a:repo)
  else
    call system('git checkout -b' ." ". last ." ". 'origin/'.last)
  endif
endfunction

function! s:git_checkout(...) abort
  let source = filter(systemlist('git branch -a'), 'v:val[0] isnot# "*"')
  if empty(source)
    call s:echo_err("no other branch")
    return
  endif

  let opt = {
        \ 'source': source,
        \ 'mode': 'fzf',
        \ 'cb': function('s:git_checkout_cb'),
        \ }

  call s:git_exec(opt)
endfunction

command! -nargs=* Gitpush call s:git_push(<f-args>)
command! -nargs=* Gitpull call s:git_pull()
command! -nargs=* Gitblame call s:git_blame()
command! -nargs=* GitCheckout call s:git_checkout(<f-args>)
command! Lazygit call system('tmux new-window lazygit')

nnoremap <silent> gc :GitCheckout<CR>
nnoremap <silent> gf <C-w>gf 
nnoremap <silent> gF <C-w>gF 
nnoremap <silent> gx gf 
nnoremap <silent> gX gF 

" {{{ バッファ関連
function! s:buflist() abort
  return filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
endfunction

function! s:format_buffer(b)
  let name = bufname(a:b)
  let name = empty(name) ? '[No Name]' : fnamemodify(name, ":p:~:.")
  let flag = a:b == bufnr('')  ? '%' : a:b == bufnr('#') ? '#' : ' '
  let modified = getbufvar(a:b, '&modified') ? ' [+]' : ''
  let readonly = getbufvar(a:b, '&modifiable') ? '' : ' [RO]'
  let extra = join(filter([modified, readonly], '!empty(v:val)'), '')
  return printf("[%s] %s\t%s\t%s", a:b, flag, name, extra)
endfunction

function! s:delbuf(buf) abort
  exe 'bw!' a:buf[match(a:buf, '[')+1:match(a:buf, ']')-1]
endfunction

function! s:delbuflist() abort
  call fzf#run({
        \ 'source': map(copy(s:buflist()), 's:format_buffer(v:val)'),
        \ 'sink': function('s:delbuf'),
        \ 'options': "-m",
        \ 'down': '40%'},
        \ )
endfunction

command! DelBuf call s:delbuflist()
" }}}

" {{{ ディレクトリ自動生成
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
" }}}

" }}}

" vim: foldmethod=marker
"
"
"
"
"w3m setting
function! s:www(word) abort
  execute('term ++close ++shell w3m google.com/search\?q="' . a:word . '"')
endfunction

command! -nargs=1 WWW call s:www(<f-args>)

function! s:gg(package) abort
  execute('term ++close ++shell w3m pkg.go.dev/' . a:package)
endfunction

command! -nargs=1 GG call s:gg(<f-args>)

function! s:github(package) abort
  execute('term ++close ++shell w3m github.com/' . a:package)
endfunction

command! -nargs=1 Github call s:github(<f-args>)

nnoremap s <C-w>>
nnoremap S <C-w><
nnoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Right> <Nop>
"github.com/jinzhu/gorm"
nnoremap <C-o> <C-W><C-W>
inoremap <C-d> <Esc>lDa
tnoremap <C-o> <C-W><C-W>
"terminal setting
function! s:bufnew()
  " 幸いにも 'buftype' は設定されているのでそれを基準とする
  if &buftype == "terminal" && &filetype == ""
    set filetype=terminal
  endif
endfunction


function! s:filetype()
  " ここに :terminal のバッファ固有の設定を記述する
endfunction

augroup my-terminal
  autocmd!
  " BufNew の時点では 'buftype' が設定されていないので timer イベントでごまかすなど…
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType terminal call s:filetype()
augroup END

inoremap <C-g><C-g> <Esc>
nnoremap t :vert term<CR>
nnoremap <silent>cn :cn<CR>
nnoremap <silent>cp :cN<CR>
"開き括弧を入力すると自動的に閉じ括弧を挿入する(デフォルト1)
let g:paredit_mode=1
" 括弧内で改行すると追加でもう一つ改行を挿入する。サブフォーム入力支援用。(デフォルト1)
let g:paredit_electric_return = 0

" connected swank serverの際、対話窓が縦分割の右側に出てくる
let g:slimv_repl_split=4
let g:slimv_repl_name='REPL'
" 評価する画面ではCtrl-Returnをすることで評価されるようにする
let g:slimv_repl_simple_eval=0

let g:slimv_lisp='/usr/local/bin/ros run'
let g:slimv_impl='sbcl'
"let g:slimv_preferred='clisp'

" ====================================================================
" swank起動コマンド設定

" --------------------------------------------------------------------
" linuxのとき

"" roswell ver.
"let g:slimv_swank_cmd = '! xterm -e ros --load ~/.roswell/lisp/slime/$DATE/start-swank.lisp &'

"" roswell ver. (swankを直接起動)
"let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"

" --------------------------------------------------------------------
" macOSのとき
" roswell ver. (同じターミナルの新規タブでslimvが用意したswank起動)
let g:slimv_swank_cmd = '!osascript $HOME/.vim/myconfig/config_plugins/08slimv-roswell.scpt'

"" roswell ver.
"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \
"\"ros run --load $HOME/.roswell/lisp/slime/2018.03.28/start-swank.lisp\""'

"" roswell ver. (swankはslimvが用意したもの)
"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \
"\"ros run --load '.$HOME.'/.vim/bundle/slimv/slime/start-swank.lisp\""'

""clisp ver. (frame-call関数がインプリメントされないのでslime debuggerがまともに動かない)
"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \
"\"clisp --load '.$HOME.'/.vim/bundle/slimv/slime/start-swank.lisp\""'

" ====================================================================

" swankサーバのポート設定
let g:swank_port = 4005

" 括弧をカラフルに表示する
let g:lisp_rainbow=1

" asdf用のファイルタイプをlispに設定する
autocmd BufNewFile,BufRead *.asd set filetype=lisp

" 現在のファイルだけを対象としてタグファイルを作成
function! s:generate_lisp_tags()
  let g:slimv_ctags='ctags -a -f '.$HOME.'/.tags/lisp.tags '.expand('%:p').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTags call <SID>generate_lisp_tags()

" 再帰的にタグファイルを作成
function! s:generate_lisp_tags_recursive()
  let g:slimv_ctags='ctags -a -f '.$HOME.'/.tags/lisp.tags -R '.expand('%:p:h').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTagsRecursive call <SID>generate_lisp_tags_recursive()

function! s:generate_prism(...)
  if a:0 == 2
    execute 'vert term ++close docker run --rm -it -v' .. a:1 .. ':/ws -p 80:4010 stoplight/prism:3 mock -h 0.0.0.0 -d /ws/' .. a:2
  end
endfunction
command! -nargs=* GeneratePrism call <SID>generate_prism(<f-args>)
command! -nargs=* GeneratePrismCurrent execute 'GeneratePrism %:p:h %:t'
nnoremap <silent>gm :GeneratePrismCurrent<CR>

command! Gblame execute 'term git blame %'
nnoremap <silent>bl :Gblame<CR>
