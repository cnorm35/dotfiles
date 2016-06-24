set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'notpratheek/vim-luna'
Plugin 'cnorm35/vim-colorscheme-deepsea'
Plugin 'godlygeek/csapprox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/Toggle-NERDTree-width'
Plugin 'rking/ag.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set t_Co=256
syntax enable
colorscheme deepsea
let mapleader = " "

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --nogroup --nocolor  --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap <leader>\ :Ag<SPACE>

" syntax and formatting
set number
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
"auto-complete vim-commands
set wildmenu
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Make it obvious where 80 characters is
set textwidth=80
" Set marker one col. past 80
set colorcolumn=+1
highlight ColorColumn ctermbg=235
" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Quicker split movement
" https://github.com/christoomey/vim-tmux-navigator
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"Quicker resize of splits
nnoremap <silent> <C-w>l :vertical resize -2<cr>
nnoremap <silent> <C-w>k :resize +2<cr>
nnoremap <silent> <C-w>j :resize -2<cr>
nnoremap <silent> <C-w>h :vertical resize +2<cr>

"auto-save on leave
let g:tmux_navigator_save_on_switch = 1

" automatically rebalance windows on vim resize
"autocmd VimResized * :wincmd \|
"autocmd VimResized * :wincmd =

" automatically rebalance windows on vim resize

" zoom a vim pane, <C-w>= to re-balance
"nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
"nnoremap <leader>= :windcmd =<cr>

" open tmux pane to right with 25% of the screen or irb
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
" Quicker window re-organizing
" nnoremap <C-J> <C-w>J
" nnoremap <C-K> <C-w>K
" nnoremap <C-H> <C-w>H
" nnoremap <C-L> <C-w>L

"needed to run 'bundle binstubs rspec-core' to get this working
let g:rspec_command = "Dispatch  bin/rspec {spec}"
"Mappings for running spec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Easy assces to the start of text on a line
nmap 0 ^

" Split open .vimrc
nmap <leader>vi :vsp $MYVIMRC<cr>
" Reload changes
nmap <leader>so :source $MYVIMRC<cr>

nmap j gj
nmap k gk

"Use leader left to go to last buffer
nmap <leader><Left> <C-^> 

" This could break everything
" Set ctrl-p to have no max on files is searches
" look into setting up c-tags to see if it speeds it up
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 0 " open files in a new buffer
let g:ctrl_p_working_path = 0 " change the working directoryduring a vim session
