set nocompatible
set nu
set rnu
set noshowmatch
set wildmenu
set wildignore=*.o,*~,*.pyc
set noerrorbells
set smartcase
set nohlsearch
set incsearch
set magic
syntax enable
set updatetime=50

set termguicolors

set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

set hidden
set encoding=utf8
set expandtab
set smarttab
set smartindent
set wrap
set laststatus=2

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
set cursorline
highlight ColorColumn ctermbg=0 guibg=lightgrey

set splitbelow
set splitright

set scrolloff=3 " Keep 3 lines below and above the cursor

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

" Remove trailing white-space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" GRUVBOX """""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" INDENTATION """""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" Use autocmd as long as we have only few file types, else switch to cleaner
" specific files per filetype, see
" https://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" https://vim.fandom.com/wiki/Indenting_source_code
set tabstop=4 softtabstop=4
set shiftwidth=4
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=4 softtabstop=4

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" VIM-SURROUND """"""""""""""
""""""""""""""""""""""""""""""""""""""""""
let g:surround_100 = "{{ \r }}"

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" VIM-AIRLINE """""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" For Airline to show open buffers in tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" FZF """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '~50%' }

""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" RG """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

if executable('rg')
    let g:rg_derive_root='true'
endif

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" NERDTREE """"""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" Leave Vim when the only buffer open is a NerdTree tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" COC """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" CoC Config
let g:coc_global_extensions = [
  \ 'coc-yaml',
  \ 'coc-json',
  \ 'coc-python',
  \ ]

set signcolumn=yes
