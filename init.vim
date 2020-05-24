" NeoVim RC file
" Bind to ~/.config/nvim/init.vim

" ~~~~ Preferences ~~~~

" Enable mouse usage
set mouse=a

" ~~~~ Keybinds ~~~~

map <C-o> :NERDTreeToggle<CR>

" ~~~~ Plugins ~~~~
" Don't forget to run :PlugInstall in vim

" Init vim-plug
call plug#begin('~/.config/nvim/vimplugins')

" Lightline
Plug 'itchyny/lightline.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Multi-cursor
Plug 'terryma/vim-multiple-cursors'

" vim-eunuch
Plug 'tpope/vim-eunuch'

" vim-surround
Plug 'tpope/vim-surround'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Emmet
Plug 'mattn/emmet-vim'

" ALE
" Plug 'dense-analysis/ale'

" GitGutter
Plug 'airblade/vim-gitgutter'

" fugitive
Plug 'tpope/vim-fugitive'

" nerd commenter
Plug 'preservim/nerdcommenter'

" Rainbow
" Plug 'luochen1990/rainbow'
Plug 'kien/rainbow_parentheses.vim'

" ACK
Plug 'mileszs/ack.vim'

" Tlist
Plug 'vim-scripts/taglist.vim'

" Syntastic
Plug 'scrooloose/syntastic'

" Initialize plugin system
call plug#end()

" ~~~~ Plugin Config ~~~~

" Enable filetype plugins
filetype plugin on

" Start nerdtree on opening vim in a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Stop nerdtree if it is the last window alive
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Make EditorConfig compatible with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Enable rainbow
let g:rainbow_active = 1

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces