" ---------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('rking/ag.vim')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('majutsushi/tagbar')
call dein#add('thinca/vim-ref')
call dein#add('ujihisa/ref-hoogle')
call dein#add('ujihisa/unite-haskellimport')
call dein#add('eagletmt/ghcmod-vim')
call dein#end()

" call dein#install()

" ---------------------
" ag
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogrep'
  let g:unite_source_grep_max_candidates = 200
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" ---------------------
" GNU generate
" nmap <C-q> <C-w><C-w><C-w>q
" nmap <C-g> :Gtags -g
" nmap <C-l> :Gtags -f %<CR>
" nmap <C-j> :Gtags <C-r><C-w><CR>
" nmap <C-k> :Gtags -r <C-r><C-w><CR>
" nmap <C-n> :Gtags :cn<CR>
" nmap <C-p> :Gtags :cp<CR>

" ---------------------
if $PWD != $HOME && $PWD != $HOME . "/dotfiles" && filereadable("./.vimrc")
  source ./.vimrc
endif

" ---------------------
" auto-ctags : genrate when save file
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
set tags+=.git/tags;/,codex.tags;/

" ---------------------
" Unite
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" ---------------------
" vimshell
let g:VimShell_EnableInteractive = 1
nnoremap <silent> :scl :VimShellInteractive sbcl<cr>
nnoremap <silent> ,is :VimShellSendString

if has('macunix')
	let mapleader = "_"
endif

" ---------------------
" augroup vimrc-haskell-sort-import
"   autocmd!
"   autocmd BufWritePre *.hs HaskellSortImport
" augroup END

" ------
" tagbar
nmap <F8> :TagbarToggle<CR><C-w>l
" for haskell
let g:tagbar_type_haskell = {
  \ 'ctagsbin'  : 'hasktags',
  \ 'ctagsargs' : '-x -c -o-',
  \ 'kinds'     : [
    \  'm:modules:0:1',
    \  'd:data: 0:1',
    \  'd_gadt: data gadt:0:1',
    \  't:type names:0:1',
    \  'nt:new types:0:1',
    \  'c:classes:0:1',
    \  'cons:constructors:1:1',
    \  'c_gadt:constructor gadt:1:1',
    \  'c_a:constructor accessors:1:1',
    \  'ft:function types:1:1',
    \  'fi:function implementations:0:1',
    \  'o:others:0:1'
    \ ],
  \ 'sro'        : '.',
  \ 'kind2scope' : {
    \ 'm' : 'module',
    \ 'c' : 'class',
    \ 'd' : 'data',
    \ 't' : 'type'
  \ },
  \ 'scope2kind' : {
    \ 'module' : 'm',
    \ 'class'  : 'c',
    \ 'data'   : 'd',
    \ 'type'   : 't'
  \ }
\ }


let g:rt_cw = ''
function! RT()
  let cw = expand('<cword>')
  try
    if cw != g:rt_cw
      execute 'tag ' . cw
      call search(cw, 'c', line('.'))
    else
      try
        execute 'tnext'
      catch /.*/
        execute 'trewind'
      endtry
      call search(cw, 'c', line('.'))
    endif
    let g:rt_cw = cw
  catch /.*/
    echo "no tags on " . cw
  endtry
endfunction
" map <C-]> :call RT()<CR>

" ---------------------
map <Leader>r <Esc>:!sbcl --script %<CR>

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

set cursorline

imap <C-j> <esc>

syntax on


