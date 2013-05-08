" Arpeggio lets us define key-chord combos (simultaneous key presses)
"call arpeggio#load()

" ================ Shortcuts ========================

let mapleader=","             " change the leader to be a comma vs slash

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" quickfix navigation
nmap <leader>cn :cn<CR>
nmap <leader>cp :cp<CR>

" move line onto previous line
nmap <leader>bl ^d0i<C-H> <Esc>w
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
" ctrl-jklm  changes to that split
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

" Toggle paste
"set pastetoggle=<C-@>
nmap <leader>@ :set invpaste<CR>

" Toggle hidden chars
nmap <C-A> :set list!<CR>
" Toggle line numbers
nmap <C-L> :set nu!<CR>

" ========================================
" General vim sanity improvements
" ========================================

" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

" ,# Surround a word with #{ruby interpolation}
"map ,# ysiw#
"vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" gary bernhardt's hashrocket
imap ,<c-l> <space>=><space>

" Change inside various enclosures with Cmd-" and Cmd-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <C-I>' f'ci'
nnoremap <C-I>" f"ci"
nnoremap <C-I>( f(ci(
nnoremap <C-I>) f)ci)
nnoremap <C-I>[ f[ci[
nnoremap <C-I>] f]ci]

"Go to last edit location with ,.
nnoremap ,. '.

" Command-/ to toggle comments
map ,# :TComment<CR>
vmap ,# :TComment<CR>

" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" create <%= foo %> erb tags using Ctrl-k in edit mode
"imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
"imap <silent> <C-J> <%  %><Esc>2hi

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
"nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
"nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

nnoremap ,- :s/\s\+$//<CR>
vnoremap ,- :s/\s\+$//<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" ============================
" SplitJoin plugin
" ============================
"nmap sj :SplitjoinSplit<cr>
"nmap sk :SplitjoinJoin<cr>

