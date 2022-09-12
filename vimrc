" g:env will be used to know which type of OS is running.
if has('win64') || has('win32')
    let g:env = "WINDOWS"
    let g:thisTab = 0
    let g:prevTab = 0
else
    let g:env = "OTHER"
endif

" Color configs.
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }
colorscheme pablo

" Used to make key combinations.
let mapleader = ","

" It eliminates waiting time in key combinations.
set notimeout
set nottimeout

" Enables filetype.
filetype plugin on
filetype indent on

" Define un funcionamiento normal del Backspace
set backspace=indent,eol,start

" Grabado rápido.
nmap <leader>w :w!<cr>

" Cierra la ventana actual.
nmap <leader>q<leader> :q<cr>

" Sale de Vim si todos los buffers están guardados.
nmap <leader>qa :qa<cr>

" Deja 5 líneas de espacio entre el cursor y los bordes verticales de la ventana cuando se escrollea.
set so=5

" Modo normal: atajo para acceder al tag debajo del cursor (la combinación de teclas por defecto
" no la puedo realizar con mi computadora).
nmap <leader><leader>t <C-]>

" Modo normal: copia desde el cursor hasta el fin de línea.
map Y y$

" Siempre muestra la línea de estado.
set laststatus=2

" Cuando se presiona TAB en la línea de comandos, muestra las opciones posibles.
set wildmenu

" Muestra el número de línea de la línea actual y el número relativo
" de línea del resto de las líneas.
set number
set relativenumber

" Invierte los valores de 'number' y 'relativenumber'.
nmap <leader>sn :set number!<enter>:set relativenumber!<enter>


" Habilita el mouse para escrollear y redimensionar.
set mouse=a

" Habilita el plegamiento de texto mediante indentación, y está
" desactivado por defecto.
set foldmethod=indent
set nofoldenable

" Lee automaticamente los archivos si fueron modificados por fuera de Vim
set autoread

" Incrementa el límite del comando deshacer.
set history=1000

" Deshabilita el sonido cuando se produce un error, y en cambio muestra
" un pantalleo blanco.
set noerrorbells
set visualbell

" Altura de la barra de comandos.
set cmdheight=2

" Ignora las mayúsculas cuando busca.
set ignorecase

" Resalta los resultados de las búsquedas.
set hlsearch

" Hace que la búsqueda actúe como en los navegadores modernos.
set incsearch

" Muestra los paréntesis complementarios cuando el cursor está encima de alguno.
set showmatch 

" Subraya la línea en la que se encuentra actualmente el cursor.
set cursorline

" Habilita el resaltado por sintaxis.
syntax enable

" Configura el encoding por defecto a UTF8.
set encoding=utf8

" Configura el formateo de final de línea utilizado
set fileformat=unix

" Deshabilita el backup.
set nobackup
set nowb
set noswapfile

" Utiliza espacios en vez de tabs.
set expandtab

" Utilizar tabs inteligentemente.
set smarttab

" 1 tab = 2 espacios.
set shiftwidth=2
set tabstop=2

" Separación de línea a los  500 caracteres.
set lbr
set tw=500

" Auto indentación.
set ai

" Indentación inteligente.
set si

" Envoltura de líneas.
set wrap

" VISUAL: presionando * o # busca la selección actual.
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" VISUAL: encierra lo seleccionado en paréntesis y comillas.
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $q <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>

" VISUAL: busca el texto seleccionado y llama a reemplazar.
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" INSERT: crea ambos paréntesis/comillas, y deja el cursor dentro.
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $" ""<esc>i
inoremap $' ''<esc>i
inoremap $< <><esc>i

" INSERT: el cursor avanza un carácter.
inoremap $$ <esc>la

" Mapea <Space> a / (búsqueda) y Ctrl-<Space> a ? (búsqueda reversa).
map <space> /
map <c-space> ?

" Moverse entre ventanas.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Mapeos para pestañas.
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
if g:env == "WINDOWS"
  map <leader>t<leader><leader> :tabnext g:tabAnterior<enter>
  " Todavía no funciona.
else
  map <leader>t<leader><leader> :tabnext #<enter>
endif

" Cambia el directorio de trabajo actual al directorio del buffer actual.
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Mapeos de buffers.
nmap <leader>b<leader> :buffers<enter>
nmap <leader>bd :bw<space>
nmap <leader>bo :b<space>


" Regresa a la última posición al editar archivos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Mueve una línea de texto utilizando Alt+[j | k] o Command+[j | k] en Mac.
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Mapeos para espaciado de líneas.
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

"""""""""""""""""""""""""""""""""""""
" Sector de definición de funciones "
"""""""""""""""""""""""""""""""""""""

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

