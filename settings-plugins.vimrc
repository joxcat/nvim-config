" ColorTheme
let g:onedark_terminal_italics = 1
colorscheme onedark

" Local wiki
"" let g:vimwiki_list = [{'path': '~/.config/nvim/vimwiki/'}]

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1

" Skim / FzF
" https://github.com/lotabout/skim.vim "
" https://github.com/junegunn/fzf.vim "
fun! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfun
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nmap <leader>l :Lines<cr>
nmap <leader>f :Files<cr>
nmap <leader>r :Rg<cr>

" Context.vim
" https://github.com/wellle/context.vim "
let g:context_enabled = 0

" FastFold
" https://github.com/Konfekt/FastFold "
let g:fastfold_savehook = 1
let g:rust_fold = 1

" Vim-vue
" https://github.com/posva/vim-vue "
let g:vue_pre_processors = []

" Vim markdown
" https://github.com/plasticboy/vim-markdown "
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 0
let g:vim_markdown_frontmatter = 0
let g:vim_markdown_toml_frontmatter = 0
let g:vim_markdown_json_frontmatter = 0
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_fenced_languages = ['rust=rs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Lightline
" https://github.com/itchyny/lightline.vim "
" https://github.com/mengelbrecht/lightline-bufferline "
let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\ 'left': [
	\ [ 'mode', 'paste' ],
	\ [ 'gitbranch', 'readonly', 'filename', 'modified' ]
	\ ],
	\ 'right': [
	\ [ 'lineinfo' ],
	\ [ 'percent' ],
	\ [ 'fileformat', 'fileencoding', 'filetype' ]
	\ ]
	\ },
	\ 'component_function': {
	\ 'gitbranch': 'FugitiveHead'
	\ },
	\ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" CtrlP
" https://github.com/ctrlpvim/ctrlp.vim "
if executable('rg')
	let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
nmap <C-P> :CtrlPMixed<cr>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': ['<C-c>'],
	\ 'AcceptSelection("t")': ['<cr>'],
	\ 'AcceptSelection("h")': ['<C-h>'],
	\ 'AcceptSelection("v")': ['<C-v>'],
	\ }
let g:ctrlp_tabpage_position = 'l'

" Easymotion
" https://github.com/easymotion/vim-easymotion "
nmap s <Plug>(easymotion-s)
nmap / <Plug>(easymotion-sn)
nmap <N> <Plug>(easymotion-next)
nmap <S-N> <Plug>(easymotion-prev)

" Utilisnips
" https://github.com/SirVer/ultisnips "
let g:UltiSnipsJumpForwardTrigger	= "<c-Left>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-Right>"
let g:UltiSnipsExpandTrigger = "<Nop>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" Gitgutter
highlight clear SignColumn

" Completion
" https://github.com/nvim-lua/completion-nvim "
"autocmd FileType rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd FileType lua setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd FileType typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc
"autocmd BufEnter * set omnifunc=v:lua.vim.lsp.omnifunc 
autocmd BufEnter * lua require'completion'.on_attach()

inoremap <c-c> <ESC>
set shortmess+=c
inoremap <expr><CR> pumvisible() ? (complete_info().selected == -1 ? "\<C-y>\<CR>" : "\<C-y>") : "\<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"let g:float_preview#docked = 0
let g:completion_enable_snippet = "UltiSnips"
let g:completion_auto_change_source = 1
let g:completion_trigger_on_delete = 1
let g:completion_chain_complete_list = [
  \{'complete_items': ['lsp', 'snippet']},
	\{'complete_items': ['path']},
	\{'complete_items': ['buffers']},
  \{'mode': '<c-p>'},
  \{'mode': '<c-n>'}
\]

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Diagnostic
" https://github.com/nvim-lua/diagnostic-nvim "
" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
"autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" NVIM Treesitter
" https://github.com/nvim-treesitter/nvim-treesitter "
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()

