" VimPlug plugins list.
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'mattn/emmet-vim'
call plug#end()

" g:env will be used to know which type of OS is running.
if has('win64') || has('win32')
    let g:env = "WINDOWS"
    let g:thisTab = 0
    let g:prevTab = 0
else
    let g:env = "OTHER"
endif

" Color configs.
" List of preference: desert, evening, habamax, lunaperche, quiet, wombat.
let g:lightline = {
  \ 'colorscheme': 'desert',
  \ }
colorscheme desert

" Eliminates waiting time in key combinations.
set notimeout
set nottimeout

" Enables filetype.
filetype plugin on
filetype indent on

" Defines a normal behaviour of backspace.
set backspace=indent,eol,start

" Used to make key combinations.
let mapleader = ","

" Open vimrc file.
nmap <leader>v<leader> :edit ~/.vim/vimrc<enter>

" Fast saving.
nmap <leader>w :w!<cr>

" Closes the current window.
nmap <leader>q<leader> :q<cr>

" Closes the current window without saving.
nmap <leader><leader>q :q!<cr>

" Quits Vim if every buffer is already saved.
nmap <leader>qa :qa<cr>

" It leaves 5 lines minimum between cursor and top and bottom borders.
set so=5

" Normal mode: accesses tag under cursor.
nmap <leader><leader>t <C-]>

" Normal mode: copies from cursor to end of line.
map Y y$

" Shortcut to show registers.
nnoremap <leader><space>r :registers<enter>

" Always shows status line.
set laststatus=2

" Shows command line options when tab is pressed.
set wildmenu

" Shows the line number of current line and relative numbers in other lines.
set number
set relativenumber

" Keeps the cursor in the same column after scrolling.
set nostartofline

" Toggles 'number' and 'relativenumber' options.
nmap <leader>sn :set number!<enter>:set relativenumber!<enter>

" Enables mouse for scrolling and resizing.
set mouse=a

" Sets folding by indentation but disables it by default.
" Also, sets 4 columns of fold levels on the left side of the window.
set foldmethod=indent
set nofoldenable
set foldcolumn=4

" Normal: adds shortcut to jump to next closed fold.
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

" Reads files automatically if they were modified.
set autoread

" Increments undo history.
set history=1000

" Disables sound on error, and shows a blank screen instead.
set noerrorbells
set visualbell

" Command bar height.
set cmdheight=2

" Ignores case when searching.
set ignorecase

" Highlights search results.
set hlsearch

" Makes search work like modern browsers.
set incsearch

" Shows complementary parenthesis when cursor is over one of them.
set showmatch 

" Underlines current line.
set cursorline

" Enables syntax highlighting.
syntax enable

" Sets UTF8 as default encoding.
set encoding=utf8

" Sets line ending format.
set fileformat=unix

" Disables backup.
set nobackup
set nowb
set noswapfile

" Uses spaces instead of tabs.
set expandtab

" Enables smart tabs.
set smarttab

" 1 tab = 4 spaces.
set shiftwidth=4
set tabstop=4

" Sets line separation at 500 characters.
set lbr
set tw=500

" Sets auto and smart indentation.
set ai
set si

" Sets line wrapping.
set nowrap

" Visual mode: fordward searches or reverse searches current selection, pressing * or #, respectively.
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Visual mode: wraps selection between different elements.
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $q <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>

" Enter substitute command with word under the cursor as search pattern (first line)
" or with visual selection as search pattern (second line).
nnoremap <leader>s :%s/<C-r><C-w>//gc<left><left><left>
vnoremap <leader>s :<C-u>call VisualSelection('', '')<CR>:%s/<C-R>=@/<CR>//gc<left><left><left>

" Insert mode: creates both parenthesis/brackets/quotes and leaves cursor in between.
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $" ""<esc>i
inoremap $' ''<esc>i
inoremap $< <><esc>i

" Maps <space> to / (forward search) and ctrl-<space> to ? (reverse search).
map <space> /
map <c-space> ?

" Moves between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Window useful mappings.
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
if g:env == "WINDOWS"
  " Still doesn't work.
  map <leader>t<leader><leader> :tabnext g:tabAnterior<enter>
else
  map <leader>t<leader><leader> :tabnext #<enter>
endif

" Changes current working directory to current buffer directory.
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Buffer mappings.
nmap <leader>b<leader> :buffers<enter>
nmap <leader>bd :bw<space>
nmap <leader>ba :b<space>#<enter>
nmap <leader>bo :b<space>

" Comes back to last position when opening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Moves a text line in Mac.
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Line spacing useful mappings.
nmap <space>j<space> o<Esc>k
nmap <space><space>j o<Esc>
nmap <space>k<space> O<Esc>j
nmap <space><space>k O<Esc>
nmap <space>kj o<Esc>kO<Esc>j
nmap <space>h<space> i<space><Esc>l
nmap <space><space>h i<space><esc>
nmap <space>l<space> a<space><Esc>h
nmap <space><space>l a<space><esc>
nmap <space>hl<space> i<space><esc>la<space><esc>h


""""""""""""""""""""""""
" Mappings for plugins "
""""""""""""""""""""""""

" Toggle NERDTree.
nnoremap <C-t> :NERDTreeToggle<CR>


""""""""""""""""""""""""
" Function definitions "
""""""""""""""""""""""""

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! NextClosedFold(dir)
    let cmd = 'norm!z'..a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
