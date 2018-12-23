Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
autocmd FileType python,go,cpp nmap gd <plug>(lsp-definition)


" let g:lsp_log_verbose = 1
" let g:lsp_log_file = 'vim-lsp.log'

if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

if executable('golsp')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'go-lang',
                \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
                \ 'whitelist': ['go'],
                \ })
endif

if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

" npm i -g vue-language-server
if executable('vls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vue-language-server',
        \ 'cmd': {server_info->['vls']},
        \ 'whitelist': ['vue'],
        \ })
endif

let g:lsp_async_completion = 1
