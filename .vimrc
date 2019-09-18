"required for pathogen
execute pathogen#infect() 
set mouse=a
set background=dark
set number
set tabstop=3
set shiftwidth=3
set expandtab
set pastetoggle=<F2>
set hlsearch
set ls=2
set thesaurus+=~/.vim/mthesaur.txt
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
set modeline
"set default number of modelines
set modelines=5
" case insensitive lowercase, sensitive with uppercase, xterm title and visualbell
set ignorecase smartcase title visualbell
autocmd BufReadPre *.doc set ro
autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPost *.doc %!antiword "%"
au FileType matlab set ts=4 sw=4
"set t_Co=256
colorscheme darkblue
nnoremap <F8> :setl noai nocin nosi inde=<CR>
filetype plugin on
syntax on
set fdm=syntax
au FileType tex setlocal sw=2 ts=2 spell textwidth=80 smartindent
" Disable delimitMate on tex documents
au FileType tex let b:delimitMate_autoclose = 0
map ,t :w<CR>:!pdflatex %<CR>
map ,v :!xdg-open %<.pdf &
" set to 1 to disable the Automatic Tex plugin
let g:no_atp=0
let g:atp_no_abbreviations=0
"vim-arduino syntax settings
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufReadPre *.ino setlocal ft=arduino ts=2 sw=2
set background=dark
hi SpecialKey guifg=Blue
hi MoreMsg guifg=Green
hi Visual guifg=NONE guibg=NONE
hi Folded ctermbg=4 guibg=Blue
hi FoldColumn ctermbg=7
hi DiffAdd guibg=Blue
hi DiffChange guibg=Magenta
hi DiffDelete guibg=Cyan
hi Normal guifg=Gray guibg=Black
hi Cursor guibg=White
hi lCursor guibg=White
hi Comment guifg=Cyan
hi Constant guifg=Magenta
hi Special guifg=Red
hi Identifier guifg=Cyan
hi Statement guifg=Yellow
hi PreProc guifg=Blue
hi Type guifg=Green
hi Underlined guifg=Blue
hi Todo guifg=Black
