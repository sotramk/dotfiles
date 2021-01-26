
"My vimrc file
"
" Maintainer:	Kevin Martos <sotramk@gmail.com>
"

" This must be first, because it changes other options as a side effect.
runtime! archlinux.vim
set nocompatible
filetype plugin on

" set rtp+=~/.vim/bundle/Vundle.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Plug 'VundleVim/Vundle.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
Plug 'itchyny/lightline.vim'

call plug#end()

" Use system clipboard
set clipboard=unnamed

" lightline settings
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e

" map ctrl l to line numbers
:nmap <C-l><C-l> :set invnumber<CR>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" enable all syntax highlighting
let g:python_highlight_all = 1

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>



" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file (restore to previous version)
"   set undofile		" keep an undo file (undo changes after closing)
" endif
set nobackup
set nowritebackup
set noswapfile
set history=500		" keep 50 lines of command line history
set number relativenumber             " show line number
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
"set pastetoggle=<F2> "F2 before pasting to preserve indentation

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "colorscheme jellybeans
  "colorscheme zenburn
  colorscheme seoul256
  set hlsearch
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on
  "filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" {{{ netrw: Configuration
"     ====================

let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" hide gitignore'd files
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default (this is the string toggled by netrw-gh)
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" }}}


map <F6> :setlocal spell! spelllang=en_us<CR>
map <F5> i{<Esc>ea}<Esc>
map <F4> i(<Esc>ea)<Esc>
map <F3> i[<Esc>ea]<Esc>
map \c i{<Esc>ea}<Esc>
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

