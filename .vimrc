" ----------------------------------------------------
" Basic Vim Setting
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap

set incsearch
set ignorecase " or noignrecase

let mapleader = "\<Space>"

inoremap <silent> jj <ESC>
nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Down>  :$tabnew<CR>
nnoremap <leader>0 :$tabnew<CR>

" https://yuta84q.hatenadiary.org/entry/20090319/1237471714
highlight TabLineFill term=NONE cterm=NONE ctermbg=0
highlight TabLine     term=NONE cterm=NONE ctermbg=0 ctermfg=DarkBlue
highlight TabLineSel  term=bold,reverse cterm=bold,reverse ctermbg=0

" ----------------------------------------------------
set runtimepath+=~/.fzf

let s:dein_dir = expand('$HOME/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"if &compatible
"    set nocompatible               " Be iMproved
"endif
" dein.vimがない場合githubからDL
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " プラグインリスト(toml)
    let g:rc_dir    = expand('$HOME/.vim')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    " tomlのロード
    call dein#load_toml(s:toml,      {'lazy':0})
    call dein#load_toml(s:lazy_toml, {'lazy':1})
    " 設定終了
    call dein#end()
    call dein#save_state()
endif
" Required:
filetype plugin indent on
syntax enable
" 未インストールがあればインストール
if dein#check_install()
    call dein#install()
endif

" ----------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 0
let g:SuperTabDefaultCompletionType = 'context'

" ----------------------------------------------------
nnoremap <leader>e : Files<CR>
nnoremap <leader>w : Rg<CR>
nnoremap <leader>f : FZFOpenFile<CR>
command! FZFOpenFile call FZFOpenFileFunc()

function! FZFOpenFileFunc()
    let s:file_path = expand("<cfile>")
    if s:file_path == ''
        echo '[Error] <cfile> return empty string.'
	    return 0
    endif
    call fzf#run({
        \ 'source': 'find . -type d -follow -name .git -prune -o ! -name .DS_Store',
        \ 'sink': 'e',
        \ 'options': '-x +s --query=' . shellescape(s:file_path),
        \ 'down': '40%'})
endfunction

" ----------------------------------------------------

