set smartindent
set expandtab                " expand tabs to spaces
set smarttab                 " no tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number

" set cursor style for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

source $HOME/.vim/rc/plugins.vim
