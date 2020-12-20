setlocal tabstop=4 
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal foldmethod=indent

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_completion_autoimport = 1

nnoremap <leader>R :!python3 %<CR>
