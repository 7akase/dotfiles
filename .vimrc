" vimshell
let g:VimShell_EnableInteractive = 1
nnoremap <silent> :scl :VimShellInteractive sbcl<cr>
nnoremap <silent> ,is :VimShellSendString


set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" ここにインストールしたいプラグインのリストを書く
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
" 
NeoBundle 'Shougo/unite.vim'
 
" Plugins for haskell programming
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'ujihisa/neco-ghc'
"NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'dag/vim2hs'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'scrooloose/nerdtree'

NeoBundle 'vim-scripts/taglist.vim'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a firefox'

filetype plugin on
filetype indent on

NeoBundleCheck

let g:quickrun_config = {
                        \ "_":{
                        \ "outputter/buffer/split":":botright 6sp",
                        \ "outputter/buffer/close_on_empty":1
                        \ },
                        \}
    


if has('macunix')
	let mapleader = "_"
endif

map <Leader>r <Esc>:!sbcl --script %<CR>

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

syntax on

if $PWD != $HOME && filereadable("./.vimrc")
  source ./.vimrc
endif

