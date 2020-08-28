call plug#begin()
" rust code completion and navigation
Plug 'racer-rust/vim-racer'

" rust erro checking, source browsing, formatting, playpen integration,
" running test
Plug 'rust-lang/rust.vim'

" rust play (rust.vim) depends on webapi.vim (https://github.com/mattn/webapi-vim)
Plug 'mattn/webapi-vim'

" provides an easy way to browse the tags of the current file
Plug 'majutsushi/tagbar'

" syntastic is a syntax checking plugin for Vim
Plug 'vim-syntastic/syntastic'

" is a file system explorer for the Vim editor
Plug 'preservim/nerdtree'

" status line
Plug 'itchyny/lightline.vim'

" fzf search plugin
Plug 'junegunn/fzf.vim'

" git plugin for vim
Plug 'tpope/vim-fugitive'

" latex
Plug 'lervag/vimtex'

" Conceal
Plug 'KeitaNakamura/tex-conceal.vim'
call plug#end()

" buffer
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" turns on the detection, plugin, and indent configurations
filetype plugin on

" enables syntax highlighting
syntax on

" enables number
set number

" rust racer
let g:racer_cmd = "/Users/lukashettwer/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

" disable scratch preview
set completeopt-=preview

" rust.vim
" if you set g:rust_clip_command RustPlay will copy the url to the clipboard
let g:rust_clip_command = 'pbcopy'
" enables the automatic execution of :RustFmt when a buffer is saved
let g:rustfmt_autosave = 1

" tagbar
nmap <F8> :TagbarToggle<CR>

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree
map <C-m> :NERDTreeToggle<CR>
" exits vim when NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" show hidden files
let NERDTreeShowHidden=1

" fzf
set rtp+=/usr/local/opt/fzf

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" spell check
autocmd FileType latex,tex,md,markdown setlocal spelllang=en_us,de spell
set spellfile=~/.config/nvim/spell/de.utf-8.add
set dictionary=~/.config/nvim/dict/de.dict

" highlight the cursor
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey	 ctermfg=white
