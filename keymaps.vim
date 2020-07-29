let mapleader = " "

nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :Files<CR>

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Autocomplete related commands
inoremap <expr> <C-j> pumvisible() ? "<C-n>" :"<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"
inoremap <expr> <C-l> pumvisible() ? "<C-y>" : "<C-l>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
inoremap <expr> <C-h> pumvisible() ? "<C-e>" : "<C-h>"

" Blank line insertion in Normal mode
nnoremap <silent> <leader>O  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> <leader>o  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>
