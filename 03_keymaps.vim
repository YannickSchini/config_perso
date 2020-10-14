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

" Auto closing with matching brackets
inoremap ( ()<C-G>U<Left>
inoremap [ []<C-G>U<Left>
inoremap { {}<C-G>U<Left>
inoremap " ""<C-G>U<Left>
" inoremap ' ''<C-G>U<Left>

" Vim fugitive mappings
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gci :Gcommit<CR>
nnoremap <leader>gpush :Gpush<CR>
nnoremap <leader>gpull :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""" COC """"""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
