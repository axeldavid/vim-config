"""""""""""""""""""""""""""""""""""
" Based on config from samueljon
"""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'terryma/vim-multiple-cursors'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'janko-m/vim-test'
Plugin 'sjl/gundo.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'rstacruz/sparkup'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/MatchTagAlways'
Plugin 'alvan/vim-closetag'
Plugin 'pmsorhaindo/syntastic-local-eslint.vim'

" Base config
set fileencodings=ucs-bom,utf-8,latin1
set nocompatible
set number
set relativenumber
set ruler
set title
set smarttab
set incsearch
set wildmenu
let g:solarized_termcolors=256
set t_Co=256

syntax on
set hlsearch

" Birta tákn fyrir línubil, nbsp og tab
set list
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅
set background=dark
colorscheme solarized
let &guicursor = &guicursor . ",a:blinkon0"	"Slökkvum á blikkandi bendli
" Show the current command in the lower right corner
set showcmd
" Show the current mode
set showmode
augroup indent_settings
    au!
    au BufEnter *.html setl autoindent smartindent
augroup END

" Code folding
setlocal foldmethod=syntax
setlocal nofoldenable
filetype off
filetype indent on
filetype plugin on

" Syntastic
let g:syntastic_enable_signs=1

" Set comma as leader
let mapleader = ","

" Mouse actions
nnoremap <2-LeftMouse> <C-]> " Double click to jump to definition
nnoremap <MiddleMouse> <C-T> " Middle click to jump back
set mouse=a

""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""
nnoremap <leader>d :NERDTreeToggle<cr>	"Nota d sem flýtilykil
nnoremap <leader>D :NERDTree<CR><C-w>p:NERDTreeFind<CR>

let NERDChristmasTree = 1               " Virkja liti í NERDTree
let NERDTreeHighlightCursorline = 1     " Lýsa upp bendil
let NERDTreeMapActivateNode='<CR>'      " Virkja Enter/Return til að opna greinar

let Tlist_Ctags_Cmd = '/usr/local/bin/jsctags'

let g:airline_enable_syntastice=1
let g:airline_enable_fugutive=1
let g:airline#extensions#tabline#enabled = 1


set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

setlocal spell spelllang=en

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab


" Lilypond
set runtimepath+=/usr/share/lilypond/2.14.2/vim/

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Hotkeys from andri
imap jk <Esc>
noremap ss :w<CR>
noremap qq :q<CR> 
set pastetoggle=<F2>

" Persistent undo
try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 " maximum number of changes that can be undone
  set undoreload=10000 " maximum number lines to save for undo on a buffer reload
catch
endtry

" No codefolding by default
set foldlevel=1

" Allow JSX in javascript
let g:jsx_ext_required = 0

" Configure Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" vim tests
let test#strategy = 'dispatch'
nmap <leader>t :TestNearest<CR>
nmap <leader>T :TestFile<CR>
nmap <leader>a :TestSuite<CR>
nmap <leader>l :TestLast<CR>
nmap <leader>g :TestVisit<CR>

" Easymotion
map <Leader> <Plug>(easymotion-prefix)

" CtrlP
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|node_modules|logs|amps-standalone|venv|test-reports)$',
    \ 'file': '\v\.(sqlite3|swo|swp|pyc)$',
    \ }

" The following is to resolve conflicts between ultisnip and YCM
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YouCompleteMe Close preview window automatically
autocmd CompleteDone * pclose

" MatchTagAlways and vim-closetag should detect js and jsx files
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.js,*.html.erb"

set exrc
set secure
