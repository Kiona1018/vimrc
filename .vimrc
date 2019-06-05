syntax on
set number
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt-=preview
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set wildmenu
set nocompatible
set statusline=
set statusline+=%t
set statusline+=\ word_count:%{WordCount()}


let g:clang_c_options = '-std=gnu14'
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'

filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'justmao945/vim-clang'
    NeoBundle 'terryma/vim-multiple-cursors'
    NeoBundle 'gioele/vim-autoswap'
    NeoBundle 'tomtom/tcomment_vim'
    NeoBundle 'easymotion/vim-easymotion'
    NeoBundle 'VundleVim/Vundle.vim'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    NeoBundle 'Yggdroot/indentLine'
    call neobundle#end()
endif

filetype plugin indent on
nnoremap <silent><C-e> :NERDTreeToggle<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required

let g:indentLine_faster = 1

function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:word_count = str2nr(split(v:statusmsg)[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count 
endfunction


" easy motion setting
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
