call plug#begin('~/.vim/plugged')

" color scheme
Plug 'mhartington/oceanic-next'

" status/tab line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" linter support
Plug 'dense-analysis/ale'

" language server protocol
Plug 'prabirshrestha/vim-lsp'

" tmux navigation support
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set backspace=indent,eol,start
set number

" Enable true colors if available
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" set color scheme
colorscheme OceanicNext

" Enable italics, Make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi SpellBad cterm=underline gui=underline ctermfg=131
hi SpellCap cterm=underline gui=underline ctermfg=Blue
hi SpellLocal cterm=underline gui=underline ctermfg=Cyan
hi SpellRare cterm=underline gui=underline ctermfg=Magenta

" set spell spelllang=en_us
set spell spelllang=en_us,de_20

" statusline
set laststatus=2
set noshowmode

" tabline
set showtabline=2
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline                  = {'colorscheme': 'powerlineish',}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ale
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {'python': ['yapf']}
let g:ale_fix_on_save = 1

" lsp
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" tmux write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
