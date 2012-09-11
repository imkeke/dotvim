runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set bg=dark
colorscheme solarized
set nocompatible
set history=400
sy on
set go=
set number
set t_vb=
set magic
set ru
set ai
set dy=lastline
set backspace=indent,eol,start
set nobackup
set hlsearch
set incsearch
set showmatch
set clipboard+=unnamed
:filetype plugin on
set directory=~/tmp,/tmp 

" Multi lines motion
vmap <C-A-Up> xkP`[V`]
vmap <C-A-Down> xp`[V`]

" tab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
if has("autocmd")
	" autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
	" autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
	" autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
	" autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
	" autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	" autocmd BufRead,BufNewFile *.js set syntax=jquery
	autocmd BufRead,BufNewFile *.vm set filetype=html
	autocmd BufRead,BufNewFile *.css set ft=css syntax=css3
	autocmd BufRead,BufNewFile *.ejs set ft=jst syntax=jst
endif
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" MacVim
if has("mac") || has("gui_macvim")
	set guifont=Monaco:h11
	" set guifont=Inconsolata:h13
	" set guifont=Courier:h12
	let s:lines=&lines
	let s:columns=&columns
	lcd ~/
endif

" split window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" file encoding
if has("multi_byte")
	set encoding=utf-8
	set termencoding=utf-8
	set formatoptions+=mM
	set fencs=utf-8,gbk
	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif
	if has("win32")
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
map <leader>t :AsyncFinder -mode=m<CR>

" tab control
nmap <C-t>	 :tabnew<CR>
nmap <C-p>	 :tabprevious<CR>
nmap <C-n>	 :tabnext<CR>
nmap <C-Tab> :tabnext<CR>
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt

" foldmethod
set foldmethod=marker

cmap <c-a> <home>
cmap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{"path": "~/Dropbox/Vimwiki/", "path_html": "~/Dropbox/Vimwiki/html/", "html_header": "~/Dropbox/Vimwiki/template/header.tpl", "html_footer": "~/Dropbox/Vimwiki/template/footer.tpl", "auto_export": 1}]

set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2
set wildmenu

func! GetPWD()
	return substitute(getcwd(), "", "", "g")
endf
if has('netbeans_intg')
	set autochdir
endif

" some nice thing
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" taglist
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

" the whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
