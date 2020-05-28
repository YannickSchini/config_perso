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

" Power up the status bar
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

