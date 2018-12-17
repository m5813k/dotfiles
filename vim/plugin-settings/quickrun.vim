" quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})

" quickrunのランナーにvimprocを使用する
" 成功時はバッファへ
" エラー時はquickfixへ出力
let g:quickrun_config._ = {
            \   'runner'    : 'vimproc',
            \   'runner/vimproc/updatetime' : 60,
            \}
let g:quickrun_config['processing'] =  {
            \     'command': 'processing-java',
            \     'exec': '%c --sketch=%s:p:h/ --output=~/Documents/Processing/output --force --run',
            \ }

let g:quickrun_config['plantuml'] = {
            \  'command': 'plantuml'
            \, 'exec': ['%c %s', 'open %s:p:r.png']
            \, 'outputter': 'null'
            \}

"quickrunでgo testを走らせる
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config['go.test'] = {'command' : 'go', 'exec' : ['%c test']}


nnoremap <Space>r :w<CR>:QuickRun <CR>
