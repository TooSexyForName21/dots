"""""""""""""""""""""""""""""
"          Vundle           "
"""""""""""""""""""""""""""""

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

" Package managers
    Plugin 'VundleVim/Vundle.vim'

" IDE plugins
    Plugin 'scrooloose/nerdtree'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'townk/vim-autoclose'
    Plugin 'godlygeek/tabular'
    Plugin 'majutsushi/tagbar'
    set rtp+=~/.fzf
    Plugin 'tpope/vim-fugitive'

" Style plugins
    Plugin 'KabbAmine/vCoolor.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'aswathkk/darkscene.vim'

" Format
    Plugin 'w0rp/ale'

" Python
    Plugin 'heavenshell/vim-pydocstring'
    Plugin 'davidhalter/jedi-vim'  " might depend on the arch package 'python-jedi'
    " Plugin 'python-mode/python-mode'

" Web Plugins
    Plugin 'mattn/emmet-vim'
    Plugin 'chrisbra/Colorizer'

    call vundle#end()            " required
    filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""
"       Plugins Configurations      "
"""""""""""""""""""""""""""""""""""""

" Style
    " colorscheme solarized
    " set background=dark
    " hi Normal guibg=NONE ctermbg=NONE       " Make backgound transparent
    " let g:solarized_contrast = 'high'

" YouCompleteMe
    let g:ycm_global_ycm_extra_conf = '/home/lidor/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_show_diagnoistcs_ui = 1
    " let g:ycm_server_keep_logfiles = 1
    " let g:ycm_server_log_level = 'debug'
    map <C-l> :YcmCompleter FixIt<CR>


" NERDTree
    let g:NERDSpaceDelims = 1
    map <C-t> :NERDTreeToggle<CR>

    let NERDTreeShowHidden = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$', '.tox$', 'venv']
    let g:NERDTreeDirArrowExpandable = ' '
    let g:NERDTreeDirArrowCollapsible = ' '
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Format
    " let g:formatter_yapf_style = 'pep8'
    " autocmd BufWrite,BufRead * :AutoFormat
    " noremap <F6> :AutoFormat<CR>
    " inoremap <F6> :AutoFormat<CR>


" Python mode
    " let g:pymode_python = 'python3'


" Airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline_theme = 'base16'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_theme='darkscene'


" vim-multiple-cursors
    " let g:multi_cursor_start_word_key      = '<C-n>'
    " let g:multi_cursor_select_all_word_key = '<A-n>'
    " let g:multi_cursor_start_key           = 'g<C-n>'
    " let g:multi_cursor_select_all_key      = 'g<A-n>'
    " let g:multi_cursor_next_key            = '<C-n>'
    " let g:multi_cursor_prev_key            = '<C-p>'
    " let g:multi_cursor_skip_key            = '<C-x>'
    " let g:multi_cursor_quit_key            = '<Esc>'

" Tabularize (aka auto text-aligner)
    nnoremap <leader>t :Tabularize /

" TagBar
    nmap <F8> :TagbarToggle<CR>

" Gutentags
    " autocmd BufWritePost * :GutentagsUpdate!

" NerdCommenter
    " For some reason VIM registers <C-/> as <C-_>...
    map <C-_> <Plug>NERDCommenterInvert
    vmap <C-_> <Plug>NERDCommenterInvert<CR>gv
