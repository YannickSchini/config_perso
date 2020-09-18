let mapleader = " "

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>of :Files<CR>
nnoremap <leader>ff :Rg<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Buffer commands
nnoremap <C-h> :bprevious<CR>
nnoremap <C-j> :Buffers<CR>
nnoremap <C-k>  :bdelete<CR>
nnoremap <C-l> :bnext<CR>

" Blank line insertion in Normal mode
nnoremap <leader>O :<C-u>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<Enter>
nnoremap <leader>o :<C-u>put =repeat(nr2char(10), v:count1) <Bar> '[-1<Enter>

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
" inoremap ' ''<C-G>U<Left>
