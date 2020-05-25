" NeoVim RC file
" Bind to ~/.config/nvim/init.vim

" ~~~~ Preferences ~~~~

" Enable mouse usage
set mouse=a

" Tab size
set tabstop=4
set shiftwidth=4
set expandtab

" Force VIM to use system clipboard
set clipboard=unnamedplus

" Enable per-project vimrc files
set exrc
set secure

" ~~~~ Keybinds ~~~~

" Open file explorer
map <C-o> :NERDTreeToggle<CR>

" Format Code
map <C-S-i> :YcmCompleter Format<CR>

" ~~~~ Commands ~~~~

" MyVIM
command MVCS :!xdg-open https://github.com/Ewpratten/myvim/blob/master/cheatsheet.md

" Gradle
command GradleBuild :!./gradlew build
command GradleTest :!./gradlew test
command GradleClean :!./gradlew clean

" FRC
command FRCDeploy :!./gradlew deploy
command FRCSimulate :!./run-simulation.sh

" Code navigation macros
command ViewDef :YcmCompleter GoToDefinition
command ViewImpl :YcmCompleter GoToImplementation
command ViewRef :YcmCompleter GoToReferences

" VIM Sessions
command Sess :mksession! ./.vimsession
command Seso :source ./.vimsession
command ReloadRC :source $MYVIMRC

" Git
command Gcq :Git add . | :Git commit -m <f-args> | :Git push

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
" Plug 'tpope/vim-surround'

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Emmet
Plug 'mattn/emmet-vim'

" GitGutter
Plug 'airblade/vim-gitgutter'

" fugitive
Plug 'tpope/vim-fugitive'

" nerd commenter
Plug 'preservim/nerdcommenter'

" Rainbow
Plug 'kien/rainbow_parentheses.vim'

" ACK
Plug 'mileszs/ack.vim'

" Tlist
Plug 'vim-scripts/taglist.vim'

" C++ Highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Unit tests
Plug 'janko-m/vim-test'

" Workspaces
Plug 'thaerkh/vim-workspace'

" Java utils
Plug 'rustushki/javaimp.vim'

" Gradle support
Plug 'tfnico/vim-gradle'

" Autocomplete
Plug 'valloric/youcompleteme'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Bracket pairs
Plug 'jiangmiao/auto-pairs'

" Personal Wiki
Plug 'vimwiki/vimwiki'

" Color theme
Plug 'sainnhe/forest-night'

" Polyglot
" Plug 'sheerun/vim-polyglot'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Dev icons
Plug 'ryanoasis/vim-devicons'

" Goyo
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

" ~~~~ Plugin Config ~~~~

" Color scheme
set termguicolors
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night
let g:lightline = {'colorscheme' : 'forest_night'}

" Enable filetype plugins
set nocompatible
filetype plugin on
syntax on

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


" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" C++
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

