set nocompatible
set nu
set rnu
set history=500
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2
set foldcolumn=1
syntax enable
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

colorscheme slate  

set encoding=utf8
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

inoremap <Tab> <Esc>`^

" For VIM Signify (default is 4000ms - way too long)
set updatetime=100

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" Integrate fzf with Vim.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify'

" Initialize plugin system
call plug#end()
