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
" set cursorline
set ruler
set noshowcmd
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
set ic
set nocompatible
set laststatus=2
set t_Co=256
set nowrap
set termencoding=utf-8
set encoding=utf-8
set autochdir
set shell=/bin/zsh
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
set colorcolumn=100
set completeopt-=preview
set completeopt=menuone
set autoread
set report=99999 " temporarily till I know what to do about it
"set foldmethod=syntax " really slow especially for omnicompletion
"set timeoutlen=1000
set relativenumber
set termguicolors

augroup mine
    autocmd BufWinEnter * sign define mysign
    autocmd BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END

" statusline related
let g:currentmode = {
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
            \ }

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
set statusline+=\ %#StatusLineInfo#%Y
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}]
set statusline+=\ %#StatusLine#%F
set statusline+=\ %#StatusLineInfo#[%{FileSize()}] " output buffer's file size
set statusline+=\ %#StatusLineReadOnly#%r
set statusline+=\ %#StatusLineChange#%m
set statusline+=%=
set statusline+=\ %#StatusLineWarning#%{LinterWarnings()}%*
set statusline+=\ %#StatusLineError#%{LinterErrors()}%*
set statusline+=\ %#StatusLineInfo#[Line:\ %l]
set statusline+=\ %#StatusLineInfo#[Column:\ %c]
set statusline+=\ [%p%%]

autocmd! InsertEnter * hi! link StatusLineMode StatusLineInsert
autocmd! InsertLeave * hi! link StatusLineMode StatusLineNormal

" go to last active tab
augroup LastTab
  autocmd!
  autocmd TabLeave * let g:last_tab = tabpagenr()
augroup END
nnoremap <expr> <m-q> get(g:, 'last_tab', 1) . 'gt'

nnoremap <silent> gf :tabfirst<CR>
nnoremap <silent> gl :tablast<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" when you select a function in omni menu and press enter,
" doesn't insert new line, instead it just selects the function
" inoremap <silent> <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>" 

"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            "\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<cr>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            "\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<cr>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <silent> <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <C-u> <C-g>u<C-u>
inoremap <C-@> <C-x><C-o>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "<C-y>"

"noremap <Leader>y "*y
"noremap <Leader>p "*p

imap <C-p> <NOP>
imap <C-n> <NOP>
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
        " filetype plugin indent on " automatically handled by vim-plug
        augroup vimrcEx
            au!
            autocmd FileType text setl textwidth=100
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
"autocmd CursorHoldI * stopinsert
"
" auto leave insert mode when change focus
"autocmd FocusLost * call feedkeys("\<C-\>\<C-n>")

" FIXME: broken function don't know why, it should have worked
"function! AutoLeaveInsertMode()
"    if v:insertmode
"        feedkeys("\<C-\>\<C-n>")
"    endif
"endfunction
"autocmd FocusLost * call AutoLeaveInsertMode()

autocmd CursorHold * silent checktime " this in combination with 'set autoread' and 'set updatetime=2000'

" Show syntax highlighting groups for word under cursor
nmap <C-S-I> :call <SID>SynStack()<CR>
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
        execute "colorscheme" g:colors_name
    endfunction
    command! Reload call ReloadConfigs()
endif

nnoremap <silent> <F11> :Reload<CR>
nnoremap <silent> <C-w>d :bdel<CR>
nnoremap <silent> g<S-l> :tabm +1<CR>
nnoremap <silent> g<S-h> :tabm -1<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"
"let g:UltiSnipsDontReverseSearchPath = "1"
let g:UltiSnipsJumpForwardTrigger = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

" NERDTree
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeMapOpenSplit = 'v'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd FileType nerdtree setl relativenumber
nnoremap <silent> <A-f> :NERDTreeToggle<CR>

" ALE
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
"let g:ale_lint_on_text_changed = 1
"let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_echo_cursor = 0
let g:ale_echo_msg_info_str = 'Info'
let g:ale_echo_mesg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
            \ 'sh': ['shellcheck'],
            \ 'c': ['clang'],
            \ 'cpp': ['clang'],
            \ 'python': ['flake8', 'mypy'],
            \ 'go': ['gopls'],
            \ 'javascript': ['eslint'],
            \ 'yaml': ['yamllint'],
            \ }
let g:ale_fixers = {
            \ 'sh': ['shfmt'],
            \ 'c': ['clang-format'],
            \ 'cpp': ['clang-format'],
            \ 'python': ['black', 'isort'],
            \ 'go': ['gofmt', 'goimports'],
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'html': ['prettier'],
            \ 'css': ['prettier'],
            \ 'yaml': ['yamlfix'],
            \ }
let g:ale_sh_shfmt_options = '-i 4 -ci -s'
let g:ale_python_black_options = '--line-length 120 --fast --skip-string-normalization'
let g:ale_python_flake8_options = '--max-line-length 120 --ignore E203 --ingore W503'
let g:ale_python_isort_options = '--profile black -l 120'
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --print-width 100'
nmap <silent> <C-x>j <Plug>(ale_next_wrap)
nmap <silent> <C-x>k <Plug>(ale_previous_wrap)

function! LinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('[Warnings: %d]', l:all_non_errors)
endfunction

function! LinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:counts.total == 0 ? '' : printf('[Errors: %d]', l:all_errors)
endfunction

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0}
let g:Lf_CursorBlink = 0
let g:Lf_ShowDevIcons = 0
let g:Lf_CommandMap = {'<C-x>': ['<C-s>'], '<C-]>': ['<C-v>']}
autocmd FileType leaderf setl nonumber
autocmd FileType leaderf setl signcolumn=no
nnoremap <silent> <C-x>b :LeaderfBuffer<CR>
nnoremap <silent> <C-x>B :LeaderfBufferAll<CR>
nnoremap <silent> <C-x>f :LeaderfFile<CR>
nnoremap <silent> <C-x>g :LeaderfFunction<CR>
nnoremap <silent> <C-x>G :LeaderfFunctionAll<CR>
nnoremap <silent> <C-x>t :LeaderfTag<CR>
nnoremap <silent> <C-x>l :LeaderfBufTag<CR>
nnoremap <silent> <C-x>L :LeaderfBufTagAll<CR>
nnoremap <silent> <C-x>r :Leaderf rg<CR>
nnoremap <silent> <C-x>m :Leaderf mru<CR>
nnoremap <silent> <C-x>h :LeaderfHistorySearch<CR>
nnoremap <silent> <C-x>c :LeaderfCommand<CR>

" indentLine
let g:indentLine_char = '│'
let g:indentLine_defaultGroup = 'IndentGuides'

" git-messenger
nnoremap <silent> gm :GitMessenger<CR>

" vim-go
let g:go_code_completion_enabled = 0
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" rust.vim
let g:rustfmt_autosave = 1
let g:rust_fold = 0
let g:rustfmt_fail_silently = 1

" vim-racer related
"let g:racer_cmd = "~/.cargo/bin/racer"
"let g:racer_experimental_completer = 1

" mundo
let g:mundo_width = 80
let g:mundo_right = 1
nnoremap <silent><F2> :MundoToggle<CR>

" emmet-vim
let g:user_emmet_leader_key = '<Leader>e'

" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-sh',
    \ "coc-pyright",
    \ "coc-go",
    \ "coc-yaml",
    \ "coc-docker",
    \ "coc-json",
    \ "coc-tsserver",
    \ "coc-html",
    \ "coc-css",
    \ ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> <C-x>i <Plug>(coc-diagnostic-info)
"if exists('*complete_info')
"  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<tab>"
inoremap <silent><expr> <c-space> coc#refresh()

" automatic vim-plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'simnalamburt/vim-mundo'
if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
if executable('go')
    Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
endif
Plug 'mkitt/tabline.vim'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'kevinoid/vim-jsonc'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
endif
Plug 'rhysd/git-messenger.vim'
"if executable('rustc')
"    Plug 'rust-lang/rust.vim'
"endif
call plug#end()
