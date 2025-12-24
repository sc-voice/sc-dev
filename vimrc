set expandtab
set nocompatible                  " Must come first because it changes other options.
syntax enable                     " Turn on syntax highlighting.
filetype plugin on                " Turn on file type detection.
set showcmd                       " Display incomplete commands.  set showmode                      " Display the mode you're in.  set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set shell=/bin/bash
set wrap                          " Turn on line wrapping.
set nomodeline                    " Allow per file config

set formatoptions-=r             " disable comment auto-indent on enter
set nows			  " stop at EOF when searching
set ic				  " ignore case when searching
set ai				  " auto indent on insert
set number			  " show line numbering
set noswapfile			  " crash and die without resurrectable corpse
set cursorcolumn		  " highlight cursor column
set cursorline			  " highlight cursor line
set nobackup			  " crash and die without resurrectable corpse
set encoding=utf-8		  " Unicode
set laststatus=2

hi Normal       ctermfg=White ctermbg=Black term=NONE cterm=NONE
hi Identifier   ctermfg=White ctermbg=Black cterm=bold term=bold

hi MatchParen   ctermfg=LightRed ctermbg=Black  cterm=bold term=bold

hi Search       ctermfg=Yellow ctermbg=BLACK cterm=bold

hi Comment      ctermfg=LightGray ctermbg=Black cterm=NONE term=NONE
hi String       ctermfg=LightGray ctermbg=Black cterm=bold term=NONE

hi Conceal      ctermfg=Red ctermbg=Black

hi Conditional  ctermfg=LightCyan ctermbg=Black
hi Constant     ctermfg=LightCyan ctermbg=Black
hi Directory    ctermfg=LightCyan ctermbg=Black
hi Keyword      ctermfg=LightCyan ctermbg=Black
hi Macro        ctermfg=LightCyan ctermbg=Black
hi NonText      ctermfg=LightCyan ctermbg=Black
hi Operator     ctermfg=LightCyan ctermbg=Black
hi Preproc      ctermfg=LightCyan ctermbg=Black
hi Special      ctermfg=LightCyan ctermbg=Black
hi SpecialKey   ctermfg=LightCyan ctermbg=Black
hi Statement    ctermfg=LightCyan ctermbg=Black cterm=NONE term=NONE
hi Type         ctermfg=LightCyan ctermbg=Black
"hi Underlined   ctermfg=LightCyan ctermbg=Black
hi VimCommand   ctermfg=LightCyan ctermbg=Black
hi CursorColumn ctermfg=LightMagenta ctermbg=Black
hi CursorLine   ctermfg=LightMagenta ctermbg=Black cterm=bold term=bold
hi StatusLine   ctermfg=DarkGray ctermbg=Yellow

hi LineNr       ctermfg=Green ctermbg=Black cterm=NONE term=NONE
hi htmlItalic	cterm=underline
hi htmlBold	cterm=underline

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.cjs set filetype=javascript
autocmd BufNewFile,BufReadPost *.mjs set filetype=javascript
set sw=2			  " shift width
set ts=2              " tab stop
set softtabstop=2
autocmd FileType javascript set sw=2 ts=2

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
command CD cd %:p:h

source ~/sc-dev/osc52.vim
vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
set shm=filmnrwxToO
set statusline=
set statusline+=%n@%c=%B:
set statusline+=%f
set statusline+=\ %m
set foldmethod=indent
set foldlevel=99
let g:markdown_recommended_style=0
