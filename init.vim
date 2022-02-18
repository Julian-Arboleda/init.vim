" git test
call plug#begin('~/.config/nvim/plugged')

" Fuzzy finder

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tpope/vim-fugitive'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim',{'branch': 'release'}  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'AndrewRadev/tagalong.vim'
Plug 'rstacruz/sparkup' "<> </>
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"C#
Plug 'https://github.com/OmniSharp/Omnisharp-vim'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/nickspoons/vim-sharpenup'

" Plebvim lsp Plugins
"
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
"Plug 'onsails/lspkind-nvim'
" Plug 'github/copilot.vim'
"Plug 'nvim-lua/lsp_extensions.nvim'
"Plug 'nvim-lua/completion-nvim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" post install (yarn install | npm install) then load plugin only for editing supported files
 Plug 'prettier/vim-prettier', {
 \ 'do': 'yarn install --frozen-lockfile --production',
 \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
 
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

set encoding=UTF-8

call plug#end()

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


" Fzf maps
nnoremap <C-p> :Files<CR>


let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
	let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"
 endif
 let g:gruvbox_invert_selection='0'
 colorscheme gruvbox
 set background=dark

 set completeopt=menuone,noinsert,noselect
 let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

"lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach } 

set ignorecase
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set linebreak
let mapleader="\<Space>"
set nobackup
set nowritebackup
set hidden
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
map Q gq
syntax on
filetype plugin indent on

nnoremap <leader>m :MaximizerToggle!<CR>
" Give more space for displaying messages
set cmdheight=2

"Having longer updatetime (default is 4000ms = 4s)
"leads to noticeable delays and poor UX
set updatetime=50

"don't pass msgs to |ins-completion-menu|
set shortmess+=c

:imap jj <Esc>
:imap kk <Esc>
nnoremap <leader>o :only<CR>

map <m-j> <C-d>
map <m-k> <C-u>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l 


" shortcut split opening
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>

" Jump to start and end of line using the home row keys
map H ^
map L $


" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>


" Move by line
nnoremap j gj 
nnoremap k gk


nnoremap <C-f> :NERDTreeFocus<CR>
noremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-a> :call CocActionAsync('jumpDefinition')<CR>
"autocmd! VimEnter * NERDTree | wincmd w

nmap <F8> :TagbarToggle<CR>

 :set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)



"```viml
let g:vimspector_enable_mappings = 'HUMAN'
"```

"| Key          | Mapping                                       | Function
"| ---          | ---                                           | ---
"| `F5`         | `<Plug>VimspectorContinue`                    | When debugging, continue. Otherwise start debugging.
"| `F3`         | `<Plug>VimspectorStop`                        | Stop debugging.
"| `F4`         | `<Plug>VimspectorRestart`                     | Restart debugging with the same configuration.
"| `F6`         | `<Plug>VimspectorPause`                       | Pause debuggee.
"| `F9`         | `<Plug>VimspectorToggleBreakpoint`            | Toggle line breakpoint on the current line.
"| `<leader>F9` | `<Plug>VimspectorToggleConditionalBreakpoint` | Toggle conditional line breakpoint or logpoint on the current line.
"| `F8`         | `<Plug>VimspectorAddFunctionBreakpoint`       | Add a function breakpoint for the expression under cursor
"| `<leader>F8` | `<Plug>VimspectorRunToCursor`                 | Run to Cursor
"| `F10`        | `<Plug>VimspectorStepOver`                    | Step Over
"| `F11`        | `<Plug>VimspectorStepInto`                    | Step Into
"| `F12`        | `<Plug>VimspectorStepOut`                     | Step out of current function scopen




" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"
"Sometimes you make several changes, and then discover you want to go back to
"when you have last written the file.  You can do that with this command: >

"	:earlier 1f

"The "f" stands for "file" here.

"You can repeat this command to go further back in the past.  Or use a count
"different from 1 to go back faster.

"If you go back too far, go forward again with: >

"	:later 1f

" Note that these commands really work in time sequence.  This matters if you
" made changes after undoing some changes.  It's explained in the next section.

" Also note that we are talking about text writes here.  For writing the undo
" information in a file see |undo-persistence|.




