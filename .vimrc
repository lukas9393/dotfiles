syntax on
set number
highlight LineNr ctermfg=blue
"ctermbg=white



set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" auto-completion
Plugin 'ervandew/supertab'

" auto-completion for quotes, ...
Plugin 'Raimondi/delimitMate'

" status bar
Plugin 'vim-airline/vim-airline'

" displays tags
Plugin 'majutsushi/tagbar'

" tree explorer
Plugin 'scrooloose/nerdtree'

" syntax checking hacks
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on 


nmap <F8> :TagbarToggle<CR>

nmap <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
