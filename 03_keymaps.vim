let mapleader = " "

nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical <CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>of :Files<CR>

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Blank line insertion in Normal mode
nnoremap <silent> <leader>O  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> <leader>o  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" CoC mappings
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Git mappings
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gci :Gcommit<CR>
nnoremap <leader>gpush :Gpush<CR>
nnoremap <leader>gpull :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>

" Auto closing with matching brackets
inoremap ( ()<C-G>U<Left>
inoremap [ []<C-G>U<Left>
inoremap { {}<C-G>U<Left>
inoremap " ""<C-G>U<Left>
inoremap ' ''<C-G>U<Left>
