if exists("b:did_ftplugin")
    finish
endif
"let b:did_ftplugin = 1

setl formatoptions-=t
setl noexpandtab " use tabs instead of spaces

cnorea im GoImport

" setting gocode activation (omnifunc) to ctrl+space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" vim-go
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <C-x>dt <Plug>(go-def-tab)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <C-x>gd <Plug>(go-doc)
au FileType go nmap <C-x>gv <Plug>(go-doc-vertical)
"au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <C-x>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <silent> <C-x>f :GoDecls <cr>
au FileType go nmap <silent> <C-x>d :GoDeclsDir <cr>
