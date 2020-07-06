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

" Handle surrounding characters easily
Plug 'tpope/vim-surround'

" Git integration within Vim
Plug 'tpope/vim-fugitive'

" Easily comment/uncomment
Plug 'tpope/vim-commentary'

" Power up the status bar
Plug 'vim-airline/vim-airline'

" More robust human failure handling
Plug 'mbbill/undotree'

" New colorscheme
Plug 'gruvbox-community/gruvbox'

" Initialize plugin system
call plug#end()

