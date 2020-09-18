call plug#begin('~/.vim/plugged')

" fuzzy file search 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" status/tab line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" display vertical lines
Plug 'Yggdroot/indentLine'

" show difference
Plug 'mhinz/vim-signify'

" support for EditorConfig
Plug 'editorconfig/editorconfig-vim'

" linter support
Plug 'dense-analysis/ale'

" color scheme
Plug 'arcticicestudio/nord-vim'

"jump support
Plug 'ludovicchabant/vim-gutentags'

" auto completen
Plug 'ycm-core/YouCompleteMe'

call plug#end()

set backspace=indent,eol,start
set termguicolors
set number
noremap f :Files<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" set color scheme
colorscheme nord

" indentline
set list lcs=tab:\|\ 
let g:indentLine_leadingSpaceEnabled = 1

" statusline
set laststatus=2
set noshowmode

" tabline
set showtabline=2
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline                  = {'colorscheme': 'wombat',}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" ale
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_php_phpstan_level = 5
let g:ale_fix_on_save = 1
let g:ale_fixers = {'php': ['phpcbf']}

" ripgrep content search
nnoremap s :exec "Rg "<cr>

autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!vendor/*" --glob "!.idea/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" gutentags
nnoremap t <C-]>
let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_exclude = [
      \ 'vendor/bin',
      \ 'vendor/phpstan',
      \ 'vendor/nikic/php-parser',
      \ 'vendor/symfony',
      \ '.git',
      \ '.idea',
      \ ]
