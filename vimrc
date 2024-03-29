"          __
"  __  __ /\_\    ___ ___   _ __   ___
" /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
" \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"  \ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"   \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/

let g:mapleader = "\<Space>" " Leaderキーをスペースに設定

" プラグイン設定をロード
exec 'source' expand('~/.plugin.vim')
syntax enable " シンタックスを有効にする
filetype plugin indent on " ファイル形式別プラグインとインデントを有効にする

" カラースキームを使う {{{
colorscheme iceberg
" icebergはターミナルを16色に設定するのを回避
if !has('nvim')
  augroup iceberg
    au!
    au ColorScheme * unlet g:terminal_ansi_colors
  augroup END
endif
set background=dark
"let g:tokyonight_disable_italic_comment = 1
"colorscheme tokyonight
" }}}

" オプション {{{
set encoding=utf-8
set t_ut=
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set belloff=all " ミュート
set backspace=2 " バックスペースとCtrl+hで削除を有効にする
set smartindent autoindent " 改行時自動インデント
set incsearch " インクリメントサーチを有効にする
set ignorecase " 検索時大文字小文字を区別しない
set smartcase " 検索時に大文字を入力した場合ignorecaseが無効になる
set hlsearch " ハイライトサーチを有効にする
set undolevels=1000 " undoできる最大数
set scrolloff=100 " カーソルが常に中央に来るようにする
set lazyredraw ttyfast " マクロで効果発揮
set synmaxcol=256 "一行が長いファイルをsyntaxを制御することで軽くする
set cursorline " カーソルラインを表示する
set wildmenu " wildmenuを有効にする
set virtualedit=block " 矩形選択時に文字の無いところまで選択範囲を広げる
set helplang=ja " ヘルプの言語を日本語優先にする
set autowrite " 他のバッファに移動する時に自動保存
set noswapfile " swapファイルを作成しない
set showtabline=2 " タブを表示しない
set noshowmode
set laststatus=2
set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:% " listの設定
if !has('nvim')
  set nrformats+=unsigned " 数値の加減算を考慮
  set cursorlineopt=line " 行のみハイライト
  set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal " セッションで保存する対象
endif
if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif " クリップボードを共有
set diffopt=vertical

" 拡張子ごとのインデント設定 {{{
augroup fileTypeIndent
  au!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType fish setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType markdown setlocal tabstop=2 shiftwidth=2  softtabstop=2 expandtab
  au FileType sql setlocal tabstop=8 shiftwidth=8  softtabstop=8 expandtab
augroup END
" }}}

" {{{ シンタックスをクリア
augroup fileTypeSyntaxClear
  au!
  au FileType go syntax clear
  au FileType vim syntax clear
  au FileType html syntax clear
  au FileType javascript syntax clear
  au FileType typescript syntax clear
  au FileType vue  syntax clear
augroup END
" }}}

" grepした結果をquickfixに表示する {{{
augroup grepwindow
  au!
  au QuickFixCmdPost *grep* cwindow
augroup END
" }}}

" カーソルラインの位置を保存する {{{
augroup cursorlineRestore
  au!
  au BufReadPost *
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
" }}}

" キーマップ {{{
" ^と0を0に統一
nnoremap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'

" *でカーソルを移動しないようにする
noremap * *N

" ファイル保存と終了
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" 検索
nnoremap <C-G><C-G> :Grep <C-R><C-W><CR>

" 置換
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
nnoremap <silent> <Leader>rq :QuickRun -runner terminal<CR>
" ハイライトを削除する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" vimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
nnoremap <Leader>s :exe "source" expand("%")<CR>

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
nnoremap o zO
" }}}

" 行先頭と行末
noremap H ^
noremap L g_

" タブ切り替え
nnoremap <C-l> gt
nnoremap <C-h> gT

" ターミナル関連 {{{
tnoremap <C-]> <C-\><C-n>
if has('nvim')
  function! s:term_start(cmd) abort
    call termopen(a:cmd)
  endfunction
else
  function! s:term_start(cmd) abort
    let old = bufnr()
    exe printf('term ++curwin ++shell %s', a:cmd)
    exe "bw!" old
    nnoremap <buffer> <silent> <CR> :bw!<CR>
  endfunction
endif

function! s:termopen() abort
  let bufname = bufname()
  let parts = split(bufname, ' ')
  let cmd = &shell
  if len(parts) > 1
    " like :new term [command] [args]
    let cmd = join(parts[1:], " ")
  endif
  call s:term_start(cmd)
endfunction

if has('nvim')
  augroup neovim-terminal
    au!
    au TermOpen * startinsert
  augroup END
else
  set termwinkey=<C-g>
  " ターミナルノーマルモード
endif

augroup terminal
  au!
  au BufNewFile term* ++nested call s:termopen()
augroup END
" }}}

" review
augroup review
  au!
  au FileType review vnoremap <silent> <buffer> <Leader>hi c@<cursor>{<c-r>"}<esc>
augroup END

" 改行
nnoremap <C-j> o<ESC>
nnoremap <C-k> O<ESC>

" Emacs風のキーマップ
inoremap <C-h> <BS>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-e> <C-o>A
inoremap <silent> <C-a> <C-o>I

" C-v でペースト
inoremap <expr> <C-v> printf('<C-r><C-o>%s', has('linux') \|\| has('unix') ? '+' : '*')
cnoremap <expr> <C-v> printf('<C-r><C-o>%s', has('linux') \|\| has('unix') ? '+' : '*')
" 囲う
nnoremap <silent> gw[ cw``<Esc>P
vnoremap <silent> gw[ c``<Esc>P

" ヘルプ
augroup help-mapping
  au!
  au FileType help nnoremap <buffer> <silent>q :bw!<CR>
augroup END

inoremap <silent> jj <Esc>
nnoremap <silent><Leader>q :q<CR>
" }}}

" コマンドラインで単語移動 {{{
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-a> <Home>
" }}}

" Better <C-n>/<C-p> in Command {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Up> <C-p>
cnoremap <Down> <C-n>
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
    au!
    au CursorHold <buffer> profile pause | q
  augroup END

  for i in range(1000)
    call feedkeys('j')
  endfor
endfunction
" }}}

" {{{ レジスタクリア
function! s:clear_register() abort
  let rs = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in rs
    call setreg(r, [])
  endfor
endfunction
command! ClearRegister call s:clear_register()
" }}}

" {{{ w3m
function! s:gg(package) abort
  execute('term ++close ++shell w3m pkg.go.dev/' . a:package)
endfunction
function! s:www(word) abort
  execute('term ++close ++shell w3m google.com/search\?q="' . a:word . '"')
endfunction

command! -nargs=1 GG call s:gg(<f-args>)
command! -nargs=1 WWW call s:www(<f-args>)
" }}}

" {{{ リポジトリに移動
function! s:cd_repo(shell, repo) abort
  exe 'lcd' trim(system('ghq root')) .. '/' .. a:repo
  pwd
endfunction

function! s:repo(cb) abort
  if executable('ghq') && exists('*fzf#run()') && executable('fzf')
    call fzf#run({
          \ 'source': systemlist('ghq list'),
          \ 'sink': a:cb,
          \ 'down': '40%'},
          \ )
  else
    echo "doesn't installed ghq or fzf.vim(require fzf)"
  endif
endfunction

command! Repo call s:repo(function('s:cd_repo', [&shell]))
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
"	cmd: 'diff'
"	args: [
"		'HEAD^',
"	],
"	auto_close: 0,	" 1: true, 0: false
"	window_way: 'bo',	" tab, bo, vert, term, etc...
"	mode: 'term', " term, popup, fzf
"	focus: 1008, " window id
"	source: [], " fzf source
"	cb: functionm "fzf callback
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
        \ 'auto_close': 0,
        \ 'window_way': 'top',
        \ 'mode': 'term',
        \ }

  call s:git_exec(opt)
endfunction

function! s:git_pull(...) abort
  let opt = {
        \ 'cmd': 'pull',
        \ 'args': a:000,
        \ 'auto_close': 0,
        \ 'window_way': 'top',
        \ 'mode': 'term',
        \ }

  call s:git_exec(opt)
endfunction

function! s:git_checkout_cb(repo) abort
  call system('git checkout' .. a:repo)
endfunction

function! s:git_checkout(...) abort
  let source = filter(systemlist('git branch'), 'v:val[0] isnot# "*"')
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
" }}}

" {{{ ディレクトリ自動生成
function! s:auto_mkdir(dir)
  if !isdirectory(a:dir)
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
augroup auto-mkdir
  au!
  au BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
augroup END
" }}}

" {{{ 画像付きツイート
function! s:on_err_vim(ch, msg) abort
  call s:echo_err(a:msg)
endfunction

function! s:exit_twty_cb(tmp_img, tmp_tweet, ch, msg) abort
  call delete(a:tmp_img)
  call delete(a:tmp_tweet)
  echom 'tweet success'
endfunction

function! s:exit_code2imge_cb(tmp_img, tweet, tmp_code, ch, msg) abort
  call delete(a:tmp_code)

  let tmp_tweet = tempname()
  call writefile([a:tweet], tmp_tweet)

  call job_start(['twty', '-m', a:tmp_img, '-ff', '-'], {
        \ 'in_io': 'file',
        \ 'in_name': tmp_tweet,
        \ 'err_cb': function('s:on_err_vim'),
        \ 'exit_cb': function('s:exit_twty_cb', [a:tmp_img, tmp_tweet])
        \ })
endfunction

function! TweetWithImg(first, last, ...) abort
  let lines = getline(a:first, a:last)
  let tmp_code = printf("%s.%s", tempname(), &ft)
  call writefile(lines, tmp_code)

  let tmp_img = tempname()

  let cmd = ['code2img', '-l', '-t', 'solarized-dark', '-ext', &ft, '-o', tmp_img]

  call job_start(cmd, {
        \ 'in_io': 'file',
        \ 'in_name': tmp_code,
        \ 'err_cb': function('s:on_err_vim'),
        \ 'exit_cb': function('s:exit_code2imge_cb', [tmp_img, a:1, tmp_code])
        \ })
endfunction

command! -nargs=? -range TweetWithImg call TweetWithImg(<line1>, <line2>, <q-args>)
" }}}

" {{{ lazygit
nnoremap <silent> gp :call system('fish -c "tmuxpopup lazygit"')<CR>
" }}}

" {{{ golangci-lint
function! s:golangci(...) abort
  if !executable('golangci-lint')
    call s:echo_err('golangci-lint doesn''t installed')
    return
  endif

  if a:0 > 0
    let opts = a:000
  else
    let opts = get(g:, 'golangci_opts', ['misspell', 'unparam', 'stylecheck',
          \ 'gosec', 'prealloc', 'gocritic', 'gomnd', 'unconvert'])
  endif

  if get(g:, 'golangci_disable_all', 0)
    let cmd = printf('golangci-lint run --disable-all --print-issued-lines=false --enable=%s', join(opts, ','))
  else
    let cmd = printf('golangci-lint run --print-issued-lines=false --enable=%s', join(opts, ','))
  endif
  cexpr system(cmd) | cw
endfunction
command! -nargs=* GolangCI call <SID>golangci(<f-args>)
" }}}

" {{{ grep
function! s:grep(word) abort
  let cmd = printf('ag -S %s', a:word)
  cgetexpr system(cmd) | cw
endfunction

command! -nargs=1 Grep call <SID>grep(<q-args>)
" }}}

" {{{ zenn
function! s:create_zenn_article(article_name) abort
  let date = strftime("%Y-%m-%d")
  let slug = date . "-" . a:article_name
  call system("npx zenn new:article --emoji 🦍 --slug " . slug )
  let article_path = "articles/" . slug . ".md"
  exe "edit " . article_path
endfunction

command! -nargs=1 ZennCreateArticle call <SID>create_zenn_article(<f-args>)
" }}}

" {{{ goimports
augroup enterd-go
  function! s:goimports() abort
    let pos = getcurpos()
    %!goimports
    call setpos('.', pos)
  endfunction
  au!
  au! FileType go nnoremap <silent> <Leader>i :call <SID>goimports()<CR>
augroup END
" }}}

" {{{ git diff log
function! s:get_currentline_diff() abort
  let lnum = getcurpos()[1]
  let fname = expand('%:p')
  vnew git-diff
  set ft=git
  nnoremap <buffer> <silent> q :bw!<CR>
  let result = systemlist(printf('git log -L %d,%d:%s', lnum, lnum, fname))
  call setline(1, result)
endfunction

command! GitDiffLog call <SID>get_currentline_diff()
" }}}

function! s:swagger_preview(file) abort
  if !executable('spr')
    call echo_err('spr deson''t installed')
  endif

  let s:swagger_preview_jobid = job_start(['spr', a:file])
endfunction

function! s:swagger_preview_stop() abort
  call job_stop(s:swagger_preview_jobid)
endfunction

command! -nargs=1 -complete=file SwaggerPreview call <SID>swagger_preview(<f-args>)
command! SwaggerPreviewStop call <SID>swagger_preview_stop()

" {{{ format
let s:format_targets = {
      \ 'javascript': '--use-tabs=false --single-quote=true %',
      \ 'html': '--use-tabs=false --single-quote=true %',
      \ 'markdown': '--use-tabs=false --single-quote=true %',
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
  if &ft is# 'javascript' || &ft is# 'html' || &ft is# 'vue' || &ft is# 'markdown'
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
" vim: foldmethod=marker
"
"" emmet {{{
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
xnoremap p "_dP
inoremap <C-d> <Esc><Esc>Di
