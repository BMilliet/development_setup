colorscheme nord
syntax on

set path+=**
set nocompatible
set wildmenu
set number
set relativenumber
set smartindent
set nowrap
set signcolumn=yes
set scrolloff=10

set shortmess+=c
"set completeopt=menuone,longest
"set complete+=k~/.vim/autocomplete/autocomplete.txt

set tabstop=4 softtabstop=4
set shiftwidth=4
set backspace=2

filetype plugin indent on

set incsearch
set hlsearch

set colorcolumn=100
set wildignore=*/.buckd/*,*/buck-ou/*,*/.git/*,*/.github/*,*/buckjavaargs/*,*/Pods/*,*/*.lock/*,*/.DS_Store/*,*/__pycache__/*

" Window movement
let mapleader = ' '
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><up> :wincmd j<CR>
nnoremap <leader><down> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>

" Auto complete menu
inoremap <expr> <Down> pumvisible() ? "<C-n>" : "<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Auto close
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Project search
command -nargs=1 PS vimgrep /<args>/g **/* | cope

" Highlight empty spaces
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Trim empty spaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" Minimalist-TabComplete-Plugin
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun


let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$']
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
