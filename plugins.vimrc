call plug#begin()

" === Editing ===
" auto-close plugin
Plug 'jiangmiao/auto-pairs'

" Surround brackets...
" Plug 'tpope/vim-surround'

" Jump in file
Plug 'easymotion/vim-easymotion'

" fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Search filename
Plug 'ctrlpvim/ctrlp.vim'

" Polyglot language pack
"" Plug 'sheerun/vim-polyglot'

" --- Autocomplete ---
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'steelsojka/completion-buffers'

" Better comments
Plug 'scrooloose/nerdcommenter'

" Code Folding
Plug 'Konfekt/FastFold'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'SirVer/ultisnips'

" === UI ===
" Bottom bar theme
Plug 'itchyny/lightline.vim'

" Editor Theme
Plug 'joshdick/onedark.vim'
" Plug 'mhartington/oceanic-next'

" Indentation help
Plug 'nathanaelkane/vim-indent-guides'
" Autodetect indent
Plug 'tpope/vim-sleuth'

" Local-wiki
"" Plug 'vimwiki/vimwiki'

" Color on colors
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Code context
Plug 'wellle/context.vim'

" Distraction free markdown
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Interactive terminal
Plug 'kassio/neoterm'

" NEOVIM ROAD TO LUA
" Syntax
"" Plug 'tjdevries/nlua.nvim'
" Scratchpad
Plug 'rafcamlet/nvim-luapad'
" Lua functions
Plug 'nvim-lua/plenary.nvim'
" Alpha popup API
Plug 'nvim-lua/popup.nvim'

" === Language plugin ===
" --- Toml ---
Plug 'cespare/vim-toml'

" --- Markdown --- "
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'

" --- Javascript ---
" Syntax base
"Plug 'othree/yajs.vim'
"" Syntax ES6
"Plug 'othree/es.next.syntax.vim'
"" Auto-import
"Plug 'galooshi/vim-import-js'
"" React JSX
"Plug 'maxmellon/vim-jsx-pretty'

" --- VueJS ---
"Plug 'posva/vim-vue'

" --- Nim ---
Plug 'alaviss/nim.nvim'

" --- Svelte ---
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()
