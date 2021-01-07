augroup rust
	fun! RustConfig()
		set ts=2 sw=2 noet
		nmap <M-r> :!cargo run<cr>
		nmap <M-c> :!cargo clippy<cr>
		nmap <M-b> :!cargo build<cr>
		nmap <M-S-b> :!cargo build --release<cr>
		nmap <M-f> :%! rustfmt --config hard_tabs=true<cr>
		" Enable type inlay hints
		autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
		\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }
	endfun
	au! WinEnter,BufEnter *.rs call RustConfig()
augroup END

augroup vue
	fun! VueConfig()
		set ts=4 sw=4 et
		nmap <M-L> :!yarn lint<cr>
	endfun
	au! WinEnter,BufEnter *.vue set filetype=vue
	au! filetype vue call VueConfig()
augroup END

augroup reactTSX
	fun! ReactTSX()
		set ts=2 sw=2 noet
		nmap <M-L> :!yarn lint<cr>
	endfun
	au! WinEnter,BufEnter *.tsx call ReactTSX()
augroup END

augroup json
	fun! JsonConfig()
		set ts=2 sw=2 noet
	endfun
	au! WinEnter,BufEnter *.json call JsonConfig()
augroup END

augroup yaml
	fun! YamlConfig()
		set ts=2 sw=2 et
	endfun
	au! WinEnter,BufEnter *.yaml call YamlConfig()
augroup END

augroup markdown
	fun! MardownConfig()
		" Because of https://github.com/junegunn/goyo.vim/issues/207
		":call lightline#init()                                                           
		:Limelight
		":Goyo
	endfun
	" https://github.com/junegunn/goyo.vim/issues/207 "
	au! WinEnter,BufEnter *.md call MardownConfig()
augroup END

augroup vimrc
	fun! VimrcConfig()
		set ts=2 sw=2 noet
		nmap <C-R> :source $MYVIMRC<cr>
	endfun
	au! WinEnter,BufEnter *.vimrc call VimrcConfig()
augroup END

augroup nim
	fun! RunWithCurrDir(command)
		let l:current_dir = getcwd()
		exec "!bash -c '". a:command ." $(basename ". l:current_dir .")'"
	endfun
	fun! NimConfig()
		nmap <C-B> :call RunWithCurrDir('nimble build')<cr>
		nmap <C-R> :call RunWithCurrDir('nimble run')<cr>
		nmap <C-E> :!nim c -r %<cr>
	endfun
	au! WinEnter,BufEnter *.nim call NimConfig()
augroup END

augroup jsconf
	fun! JSConfig()
		set ts=4 sw=4 et
	endfun
	au! WinEnter,BufEnter *.js call JSConfig()
augroup END

augroup svelte
	fun! SvelteConfig()
		set ts=2 sw=2 noet
	endfun
	au! WinEnter,BufEnter *.svelte call SvelteConfig()
augroup END

