execute pathogen#infect()
call pathogen#helptags()

set encoding=utf8 "utf8 as standard

"hybrid number mode
set relativenumber
set number
autocmd InsertEnter * :set nu nornu
autocmd InsertLeave * :set rnu nu

" Tabs
set smarttab
set tabstop=4 "width of tab character
set softtabstop=4 "finetunes amount of white spaces to be inserted/deleted
set shiftwidth=4 "amount of white space to be inserted/deleted on normal mode
set expandtab "space instead of tab

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set showmatch "show matching brackets
set hlsearch "highlight matches
set cursorline "highlight current line
"set colorcolumn=80
"set ignorecase "ignore case on search
set incsearch

syntax enable "syntax highlighting

"set background=light
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme solarized

filetype on
filetype plugin on
"autoload CloseTag for xml/html files
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

let mapleader = "\<space>"

" Spell check
nmap <silent> <leader>s :set spell!<CR>

" Show invisible characters
set listchars=tab:▸\ ,eol:¬
set list
nmap <leader>l :set list! nonu! nornu!<CR>

set hidden "manage hidden buffers

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline

" EasyMotion keybinding and shading
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" airline
let g:airline_powerline_fonts=1
let g:airline_theme="murmur"
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1

" FileType based settings
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
let g:syntastic_php_checkers=[]
let g:syntastic_javascript_checkers=['eslint']
" KeyMaps
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
" STOP using arrow keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"esc key mapping
imap jj <Esc>
nnoremap B ^
nnoremap E $
" Buffers - next/previous: F12, Shift-F12.
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <F11> :bp<CR>
nnoremap <Leader>b :ls<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Functions
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Save read-only files
cnoremap sudow w !sudo tee % >/dev/null

let g:ctrlp_custom_ignore = 'node_modules'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}
