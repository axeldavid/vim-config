"""""""""""""""""""""""""""""""""""
" Based on config from samueljon
"""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim' " Manages vim plugins
Plugin 'scrooloose/nerdtree' " File tree directory
Plugin 'scrooloose/nerdcommenter' " Comment out/uncomment coude
Plugin 'scrooloose/syntastic' " Syntax checker
Plugin 'tpope/vim-dispatch' " Separate window for suff like test results
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme (Well tested on users)
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py' } " Autocomplete
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " Status line
Plugin 'terryma/vim-multiple-cursors' " Change multiple lines simultaneously
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx' " jsx support (highlighting)
Plugin 'janko-m/vim-test' " Run unit tests within vim
Plugin 'sjl/gundo.vim' " File history
Plugin 'ctrlpvim/ctrlp.vim' " Search and open files
Plugin 'tpope/vim-surround' " Quickly add, change, delete surrounding brackets, parens, etc.
Plugin 'rstacruz/sparkup' " Zen coding
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips' " Snippets
Plugin 'honza/vim-snippets' " A bunch of snippets for ultisnips
Plugin 'mlaursen/vim-react-snippets' " A bunch of react snippets for ultisnips
Plugin 'jiangmiao/auto-pairs' " Highlights matching bracket, parens, etc.
Plugin 'Valloric/MatchTagAlways' " Highlights matching html tag
Plugin 'alvan/vim-closetag' " Closes a html tag automaticall
Plugin 'pmsorhaindo/syntastic-local-eslint.vim' " Use local .eslintrc
Plugin 'tpope/vim-eunuch' " Unix commands inside vim
Plugin 'airblade/vim-gitgutter' " Show diff in the left side pane (gutter)
Plugin 'mhinz/vim-startify' " Vim session management
Plugin 'wesQ3/vim-windowswap' " Swap windows between splits quickly
Plugin 'bkad/CamelCaseMotion' " Navigate to next camelBumpPart or underscore_part
Plugin 'wellle/targets.vim' " A bunch of useful navigation targets
Plugin 'tpope/vim-endwise' " Automatically add smart endings like fi after if [...]; do in bash
Plugin 'ap/vim-css-color' " Highlight css colors in corresponding color
Plugin 'craigemery/vim-autotag' " Autogenerate ctags
Plugin 'LaTeX-Box-Team/LaTeX-Box' " LaTeX support
Plugin 'vim-scripts/MatlabFilesEdition' " Official Matlab settings

" Base config
set fileencodings=ucs-bom,utf-8,latin1
set nocompatible
set number
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

" MatchTagAlways should detect js and jsx files.
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

" Custom highlight colors for MatchTagAlways
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=blue ctermbg=black guifg=blue guibg=black

" vim-closetag should detect js and jsx files
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.js,*.html.erb"

" Initialize CamelCaseMotion (Map default keys)
call camelcasemotion#CreateMotionMappings('<leader>')

set exrc
set secure
