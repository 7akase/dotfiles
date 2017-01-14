" vimshell
let g:VimShell_EnableInteractive = 1
nnoremap <silent> :scl :VimShellInteractive sbcl<cr>
nnoremap <silent> ,is :VimShellSendString

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

if $PWD != $HOME && $PWD != $HOME . "/dotfiles" && filereadable("./.vimrc")
  source ./.vimrc
endif

