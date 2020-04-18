" Automatically pull and load vim-plug, if isn't installed. Should run once
" per machine
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-expand-region'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'

" Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

"" using vim-polyglot for now to see how it goes. If it has issues, will go back to manually
"" selecting my language plugins.
" Plug 'othree/yajs.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'elzr/vim-json'
" Plug 'stephpy/vim-yaml'
"" yats doesn't seem to work well with vim-jsx-pretty, according to comments on the internet
" Plug 'HerringtonDarkholme/yats.vim'

" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'w0ng/vim-hybrid' 
Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto Pairs fly mode. Live life on the edge.
let g:AutoPairsFlyMode = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast switch directories
map <leader>cw :cd ~/shortbite/web-projects<cr>
map <leader>ca :cd ~/shortbite/web-projects/packages/angular-workspace<cr>

" Fix syntax highlighting for jsonc (JSON with comments)
autocmd FileType json syntax match Comment +\/\/.\+$+

" How long should vim wait for the next key before executing what it already has?
set notimeout         " Wait forever if there is a possible upcoming mapping key
set ttimeout          " Don't wait forever if there is an upcoming terminal key
set ttimeoutlen=5     " Wait 5ms in fact

" peaksea, iceberg, codedark, OceanicNext, dark_plus, ir_black, pyte, solarized, mayansmoke, palenight, onedark, hybrid
set background=dark
colorscheme codedark

" Buffer splits
nmap <leader>sh  :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk  :leftabove  new<CR>
nmap <leader>sj  :rightbelow new<CR>

""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif
