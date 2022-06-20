" plugins
if has("nvim")
  call plug#begin()
    " Plug 'tpope/vim-sensible'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'Mofiqul/vscode.nvim'
  call plug#end()
  " set colorscheme
  colorscheme vscode
  " require lua config
  lua require('config')
endif

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" filetype detection and syntax highlighting
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" indentation
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

set backspace=indent,eol,start " non-retarded backspace
set complete-=i " do not scan included files

set nrformats-=octal " dont consider octal number format as a valid number

" search
set incsearch " dont press enter when searching
set hlsearch " highlight search matches
" map ctrl+L to disable search highlight
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
endif

set laststatus=2 " show status bar even when only one vim window is open
set ruler " show cursor position
set wildmenu " show possible completion above the command line
set scrolloff=5 " have n lines above and below cursor at all times
set sidescrolloff=5 " minimum number of characters to the left and right of the cursor
set display+=lastline " dot replace a very long line with @
set encoding=utf-8 " use utf-8 for the output show in the terminal
set fileencoding=utf-8 " use utf-8 for file writing
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ " specify how characters are displayed with :list command
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276')) " fix for the fish enjoyers
  set shell=/usr/bin/env\ bash
endif

set autoread " update the file if it was changed elsewhere

if &history < 1000 " set history to 1000 if its less
  set history=1000
endif
if &tabpagemax < 50 " set maximum tab count to 50
  set tabpagemax=50
endif
if !empty(&viminfo) " prepend viminfo with ! 
  set viminfo^=!
endif

" disable saving of options, mapping and global values for sessions and views
set sessionoptions-=options
set viewoptions-=options

" load matchit.vim, but only if the user hasn't installed a newer version
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" relative line numbers
set number                    
set relativenumber

