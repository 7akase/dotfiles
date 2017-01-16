" ---------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('rking/ag.vim')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('thinca/vim-ref')
call dein#add('ujihisa/ref-hoogle')
call dein#add('ujihisa/unite-haskellimport')
call dein#end()

" call dein#install()

" ag
" ---------------------
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogrep'
  let g:unite_source_grep_max_candidates = 200
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" ---------------------
" auto-ctags : genrate when save file
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
set tags+=.git/tags;/,codex.tags;/

" ---------------------
if $PWD != $HOME && $PWD != $HOME . "/dotfiles" && filereadable("./.vimrc")
  source ./.vimrc
endif

" ---------------------
" vimshell
let g:VimShell_EnableInteractive = 1
nnoremap <silent> :scl :VimShellInteractive sbcl<cr>
nnoremap <silent> ,is :VimShellSendString

if has('macunix')
	let mapleader = "_"
endif

" ---------------------
augroup vimrc-haskell-sort-import
  autocmd!
  autocmd BufWritePre *.hs HaskellSortImport
augroup END

" ---------------------
map <Leader>r <Esc>:!sbcl --script %<CR>

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

syntax on


