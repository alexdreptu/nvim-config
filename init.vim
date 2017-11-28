" Maintainer: Alexandru Dreptu <alexdreptu@gmail.com>

if exists("colors_name")
	finish
endif

colorscheme naquadria

scriptencoding utf-8
set backspace=2
set number
set noshowmatch
set history=50
set ruler
set showcmd
set incsearch
set autoindent
set smartindent
set cindent
set expandtab " spaces
"set noexpandtab " tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5 "minimal number of screen lines to keep above and below the cursor when using j, k
"set scrolljump=-50
set sidescroll=1
set sidescrolloff=10
set nocompatible
set laststatus=2
set t_Co=256
set nowrap
set termencoding=utf-8
set encoding=utf-8
set autochdir
set shell=/bin/bash
silent execute '!mkdir -p $HOME/.config/nvim/tmp/{backup,swap,view,undo}'
set backupdir=$HOME/.config/nvim/tmp/backup/
if has("vms")
    set nobackup    " do not keep a backup file, use versions instead
else
    set backup      " keep a backup file
endif
set wildignore+=*.so,*.zip,*.rar,*.tgz,*.tar,*.pyc,*~
"set noswapfile " disabled due to high disk activity when updatetime is set to a low value
set directory=$HOME/.config/nvim/tmp/swap/
set viewdir=$HOME/.config/nvim/tmp/view/
if has("persistent_undo")
    set undodir=$HOME/.config/nvim/tmp/undo/
    set undofile
    set undolevels=1000 " How many undos
    set undoreload=10000 " number of lines to save for undo
endif
set viminfo='50,n$HOME/.config/nvim/tmp/viminfo
"set updatetime=2000 " this value only in combination with 'set noswapfile'
set fileencodings=utf-8
set noshowmode
"set showmode
"set showtabline=2
set title
set modeline
set ttyfast
set wildmenu
set wildmode=list:longest,full
"set list
set listchars=trail:\ ,tab:→\ ,extends:⟶,precedes:⟵
set fillchars+=stl:\ ,stlnc:\ ,vert:\│
"set linebreak
set showbreak=↳
"set lazyredraw
"set textwidth=79
"set wrapmargin=79
set formatoptions=qrn1
set splitright splitbelow
set shortmess+=afiIlmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set nofoldenable
set clipboard=unnamed
set hidden
set colorcolumn=80
set completeopt-=preview
set completeopt=menuone
set autoread
set report=99999 " temporarily till I know what to do about it
"set foldmethod=syntax " really slow especially for omnicompletion
"set timeoutlen=1000
set relativenumber
set termguicolors

augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END

" statusline related
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'N·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '' : 'V·Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ '' : 'S·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \}

function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return 'null'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB'
    elseif (exists('kbytes'))
        return kbytes . 'KB'
    else
        return bytes . 'B'
    endif
endfunction

set statusline=%#StatusLineMode#[%{toupper(g:currentmode[mode()])}]
set statusline+=\ %#StatusLine#%F
set statusline+=\ %#StatusLineInfo#[%{FileSize()}] " output buffer's file size
set statusline+=\ %#StatusLineReadOnly#%r
set statusline+=\ %#StatusLineChange#%m
set statusline+=%=
set statusline+=\ %#StatusLineInfo#%Y
set statusline+=\ %#StatusLineInfo#[L=%l:C=%c]
set statusline+=\ [%p]

hi! link StatusLineMode StatusLineNormal
autocmd! InsertEnter * hi! link StatusLineMode StatusLineInsert
autocmd! InsertLeave * hi! link StatusLineMode StatusLineNormal

set omnifunc=javascriptcomplete#CompleteJS

" when you select a function in omni menu and press enter,
" doesn't insert new line, instead it just selects the function
"inoremap <silent> <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>" 
"inoremap <silent> <expr> <cr> pumvisible() "\<C-y>"

"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<cr>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<cr>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <silent> <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

inoremap <C-u> <C-g>u<C-u>
inoremap <C-@> <C-x><C-o>

inoremap <expr><M-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><M-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "<C-y>"

"noremap <Leader>y "*y
"noremap <Leader>p "*p

noremap <MiddleMouse> <NOP>
noremap <MouseUp> <NOP>
noremap <MouseDown> <NOP>
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>
vnoremap <PageUp> <NOP>
vnoremap <PageDown> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
vnoremap <UP> <NOP>
vnoremap <DOWN> <NOP>
vnoremap <LEFT> <NOP>
vnoremap <RIGHT> <NOP>

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

if has('mouse')
    set mouse=""
endif

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    if has("autocmd")
        "filetype plugin indent on " automatically handled by vim-plug
        augroup vimrcEx
            au!
            autocmd FileType text setl textwidth=79
            autocmd BufReadPost *
                        \ if line("'\"") > 1 && line("'\"") <= line("$") |
                        \   exe "normal! g`\"" |
                        \ endif
        augroup END
    endif
endif

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

"autocmd CursorMoved * exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" auto leave insert mode
"au CursorHoldI * stopinsert
"
" auto leave insert mode when change focus
"au FocusLost * call feedkeys("\<C-\>\<C-n>")

" FIXME: broken function don't know why, it should have worked
"function! AutoLeaveInsertMode()
"    if v:insertmode
"        feedkeys("\<C-\>\<C-n>")
"    endif
"endfunction
"au FocusLost * call AutoLeaveInsertMode()

au CursorHold * silent checktime " this in combination with 'set autoread' and 'set updatetime=2000'

" ===== Vim Shortcuts ===== "
" Show syntax highlighting groups for word under cursor
nmap <C-S-I> :call <SID>SynStack() <cr>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <silent> <C-s> :update<cr>

if !exists("*ReloadConfigs")
    function ReloadConfigs()
        source $MYVIMRC
        "source $MYGVIMRC
        execute "colorscheme" g:colors_name
    endfunction
    command! Recfg call ReloadConfigs()
endif

nnoremap <silent> <F11> :Recfg<cr>
nnoremap <silent> <C-w>d :bdel<cr>
nnoremap <silent> g<S-l> :tabm +1<cr>
nnoremap <silent> g<S-h> :tabm -1<cr>
" ----- </shortcuts> ----- "

" ----- <plugin> ----- "

" UltiSnips related
let g:UltiSnipsEditSplit = "vertical"
"let g:UltiSnipsDontReverseSearchPath = "1"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

" NERDTree related
let g:NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <silent> <A-f> :NERDTreeToggle <cr>

" NERDCommenter related
nnoremap <silent> <C-Space> :call NERDComment(0, "toggle") <cr>

" ALE related
let g:ale_linters = {
            \ 'python': ['pylint'],
            \ 'go': ['go', 'golint'],
            \}
let g:ale_python_pylint_options = '
            \ --disable=missing-docstring
            \ --disable=too-many-arguments
            \ --disable=too-many-instance-attributes'
let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 1
"let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '⬥ ok']

nmap <silent> <C-x>j <Plug>(ale_next_wrap)
nmap <silent> <C-x>k <Plug>(ale_previous_wrap)

hi ALEErrorSign     guifg=lightred      ctermfg=red
hi ALEError         guifg=lightred      ctermfg=red
hi ALEWarningSign   guifg=yellow        ctermfg=yellow
hi ALEWarning       gui=undercurl       guisp=yellow


" TagBar related
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1
"let g:tagbar_show_linenumbers = -1

if executable('ctags')
    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
    nnoremap <silent> <F3> :TagbarOpenAutoClose<cr>
endif

" CtrlP related
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'Etvh'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_open_multiple_files = '2i'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_tabpage_position = "ac"
let g:ctrlp_extensions = ['tag', 'buffertag', 'line']
let g:ctrlp_map = '<C-x>p'
let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")': ['<C-j>', '<down>'],
            \ 'PrtSelectMove("k")': ['<C-k>', '<up>'],
            \ 'PrtHistory(-1)': ['<C-j>'],
            \ 'PrtHistory(1)': ['<C-k>'],
            \ }
nnoremap <silent> <C-x>b :CtrlPBuffer<cr>
nnoremap <silent> <C-x>l :CtrlPLine<cr>
nnoremap <silent> <C-x>ta :CtrlPTag<cr>
nnoremap <silent> <C-x>tc :CtrlPBufTag<cr>

" Autoformat related
if executable('clang-format')
    let g:formatdef_clang = '"clang-format"'
    let g:formatters_c = ['clang']
endif
if executable('autopep8')
    let g:formatdef_py_beautify = '"autopep8 -"'
    let g:formatters_python = ['py_beautify']
endif
if executable("shfmt")
    let g:formatdef_shfmt = '"shfmt --"'
    let g:formatters_sh = ['shfmt']
endif
if executable('js-beautify')
    let g:formatdef_js_beautify = '"js-beautify -f - -q -s 2 -t false -p true -m 2 -P false -E false -a false -b collapse"'
    let g:formatters_javascript = ['js_beautify']
    let g:formatdef_html_beautify = '"html-beautify -f - -q -s 2 -p true -m 1"'
    let g:formatters_html = ['html_beautify']
    let g:formatdef_css_beautify = '"css-beautify -f - -q -s 2 -p true -m 1"'
    let g:formatters_css = ['css_beautify']
endif
if executable('tsc')
    let g:formatdef_ts_beautify = '"tsfmt -r --stdin"'
    let g:formatters_typescript = ['ts_beautify']
endif

" TSuquyomi related
let g:tsuquyomi_disable_quickfix = 1

" GitGutter related
"let g:gitgutter_sign_added = 'A'
"let g:gitgutter_sign_modified = 'M'
"let g:gitgutter_sign_removed = 'D'

" EasyMotion related
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_use_upper = 1
"let g:EasyMotion_keys = 'ASDFGHJKL'
let g:EasyMotion_keys = 'asdfghjkl'
let g:EasyMotion_do_shade = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>r <Plug>(easymotion-repeat)
map <Leader>s <Plug>(easymotion-s2)
map <Leader>w <Plug>(easymotion-bd-w)

" vim-go related
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_operators = 1

" Slimv related
let g:slimv_unmap_cr = 1
let g:slimv_unmap_tab = 1
let g:slimv_unmap_space = 1
let g:paredit_electric_return = 0
"let g:paredit_shortmaps = 0

" rust.vim related
let g:rustfmt_autosave = 1
let g:rust_fold = 0
let g:rustfmt_fail_silently = 1

" vim-racer related
"let g:racer_cmd = "~/.cargo/bin/racer"
"let g:racer_experimental_completer = 1

" YouCompleteMe related
let g:ycm_key_list_select_completion = ['<M-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<M-k>', '<Up>']
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Automatic vim-plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins and Scripts
call plug#begin('~/.local/share/nvim/plugged')
Plug 'equalsraf/neovim-gui-shim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
if executable('ctags')
    Plug 'majutsushi/tagbar'
    "Plug 'vim-scripts/AutoTag'
    Plug 'ludovicchabant/vim-gutentags'
endif
if executable('go')
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
endif
Plug 'Valloric/YouCompleteMe'
Plug 'Chiel92/vim-autoformat'
Plug 'mkitt/tabline.vim'
Plug 'pangloss/vim-javascript'
"Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
if executable('rustc')
    Plug 'rust-lang/rust.vim'
endif
Plug 'vim-perl/vim-perl6'
call plug#end()
