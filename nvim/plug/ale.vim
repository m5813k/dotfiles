Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_fixers = {
            \ 'php': ['php_cs_fixer'],
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'typescript.tsx': ['prettier'],
            \ 'html': ['prettier'],
            \ 'scss': ['prettier'],
            \ 'vue': ['prettier']
            \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:ale_python_mypy_use_global = 1
