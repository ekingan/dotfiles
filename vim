" Install plugins with https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
" Can't live without
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'epmatsw/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
Plug 'preservim/nerdtree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'oblitum/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'djoshea/vim-autoread'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-vinegar'
" Extra nice
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'lucidstack/ctrlp-mpc.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'ngmy/vim-rubocop'
" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim', { 'for': 'html' }
" Elixir and Phoenix
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'powerman/vim-plugin-AnsiEsc' | Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
" Javascript
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'mtscout6/vim-cjsx', { 'for': 'javascript' }
" Linter
Plug 'w0rp/ale'
" Elm
Plug 'ElmCast/elm-vim'
" Markdown
Plug 'jtratner/vim-flavored-markdown', { 'for': 'markdown' }
" UI Plugins
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
" Plug 'itchyny/lightline.vim'
call plug#end()
"" Basic Config
set visualbell
set autoindent
set autoread
set mouse=a
set hidden
set clipboard=unnamed
set number
set scrolloff=3
set nowrap
set cursorline
set ruler
set nohlsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=2 softtabstop=2 expandtab
set list
set shell=zsh
let mapleader=","
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" Window setup
set winwidth=84 colorcolumn=81 list listchars=tab:▸\ ,trail:•,nbsp:⋅
" Colors
set background=dark
colorscheme nord
" Spelling
autocmd FileType markdown set spell
autocmd FileType markdown set spell spelllang=en_us
autocmd FileType markdown set complete+=kspell
autocmd FileType gitcommit set spell
autocmd FileType gitcommit set spell spelllang=en_us
autocmd FileType gitcommit set complete+=kspell
" Set formating program to use par
"   use the gq command to format text (gqip ftw)
if executable('par')
  set formatprg=par\ -w80
endif
" Elixir - autoformat elixir if the current elixir version is 1.6.5 or above
let s:elixir_version = system("elixir --version|tail -1")
autocmd BufWritePost *.exs silent call RunElixirFormatter()
autocmd BufWritePost *.ex silent call RunElixirFormatter()
function RunElixirFormatter()
  :!mix format %
  :e
endfunction
" AirLine
set laststatus=2
set showcmd
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline#extensions#tabline#enabled = 1 " set 1 for buffer line
let g:bufferline_echo = 0
let g:airline_mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'REPLACE',
      \ 'v' : 'VISUAL',
      \ 'V' : 'V-LINE',
      \ 'c' : 'CMD   ',
      \ '': 'V-BLCK',
      \ }
" CtrlP
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_extensions = ['mpc']
call ctrlp_bdelete#init()
" Use fenced code blocks in markdown
let g:markdown_fenced_languages=['ruby', 'javascript', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml', 'erlang']
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set textwidth=80
" ALE Configuration
let g:airline#extensions#ale#enabled = 1
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 1
let g:elm_format_autosave = 1
" Rainbow Vim
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"" MISC KEY MAPS
" Disable Arrow Keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" CtrlP buffer
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
" convert stupid 18 syntax
map <leader>19 :%s/:\(\w*\)\s*=>\s*/\1: /gci<cr>
map <leader>19! :%s/:\(\w*\)\s*=>\s*/\1: /gi<cr>
" search with Ag
noremap <leader>a :Ag<space>
noremap <leader>s :tabe<cr>:Ag<space>
" convert " to '
nmap <leader>'' :%s/"/'/gc<cr>
" no-op fucking Q
nmap Q <nop>
" quit all other splits
nmap <silent> <leader>q :only<cr>
" close the terminal window
nnoremap <silent> <leader>c :Tclose<cr>
" fix whitespace
nmap <silent> <leader>w m`:%s/\s\+$//e<cr>``:noh<cr>
nmap <silent> <leader><tab> m`:%s/\t/  /g<cr>``:noh<cr>
" Edit this file
nmap <silent> <leader>v :vsp $MYVIMRC<cr>
" Map tab and shift-tab to switch buffers.
nmap <silent> <tab> :bn<cr>
nmap <silent> <S-tab> :bp<cr>
" easy buffer switching
nnoremap <silent> <leader><leader> <c-^>
" Vim Test Mappings
map <silent> <leader>t :TestNearest<cr>
map <silent> <leader>f :TestFile<cr>
map <silent> <leader>T :TestSuite<cr>
map <silent> <leader>r :TestLast<cr>
map <silent> <leader>g :TestVisit<cr>
"" neovim-specific config
let $SIMPLE_PROMPT=1
" change cursor to bar in insert mode
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" run tests with :T
let test#strategy="neoterm"
" vertical split instead of the default horizontal
" let g:neoterm_position="vertical"
" Toggle Neoterm Position
function NeotermTogglePosition()
  if g:neoterm_position ==? "vertical"
    let g:neoterm_position="horizontal"
    echom "Set neoterm position to horizontal"
  else
    let g:neoterm_position="vertical"
    echom "Set neoterm position to vertical"
  endif
  T exit
endfunction
nnoremap <leader>z :call NeotermTogglePosition()<cr>
" pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
" ain't nobody got time for that
tnoremap <Esc> <C-\><C-n>
" Removes whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Formats JSON so I can read it
com! FormatJSON %!python -m json.tool
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

