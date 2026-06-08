" Lista de plugins de VimPlug.
call plug#begin()
    Plug 'mattn/emmet-vim'
    Plug 'Yggdroot/indentLine'
    Plug 'nikvdp/ejs-syntax'
call plug#end()

autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \ |   PlugInstall --sync | q
    \ | endif

" Abre netrw solo si Vim inicia con un buffer vacio y sin archivos.
autocmd VimEnter * if argc() == 0 && line2byte(1) == -1 | Explore | endif

" g:env se usa para saber que tipo de SO se esta ejecutando.
if has('win64') || has('win32')
    let g:env = "WINDOWS"
    let g:thisTab = 0
    let g:prevTab = 0

    " Hace que las ventanas de GVim inicien maximizadas.
    if has("gui_running")
        au GUIEnter * simalt ~x
    endif

else
    let g:env = "OTHER"

    " Hace que las ventanas de GVim inicien maximizadas.
    if has("gui_running")
        set lines=999 columns=999
    endif

endif

" Permite que ctrlp reemplace la ventana actual con la nueva,
" al seleccionar con Enter.
let g:ctrlp_open_new_file = 'r'

" Activa las marcas de indentacion.
let g:indentLine_setConceal = 1
let g:vim_json_conceal=0

" Hace que netrw cambie el directorio de trabajo actual del buffer,
" para que cambie mientras el usuario navega.
let g:netrw_keepdir = 0

" Se usa para crear combinaciones de teclas.
let mapleader = ","

" Define el grupo de comandos autocmd para netrw.
augroup netrw_fix
  autocmd!

    " Cambia el atajo a <Plug>NetrwHideEdit, por conflictos
    " con las configuraciones de este script.
  autocmd FileType netrw nnoremap <leader>h <Plug>NetrwHideEdit

    " Evita el mapeo <C-l> de netrw, para usar el de este script.
  autocmd FileType netrw nnoremap <buffer> <C-l> <C-W>l

    " Muestra numeros de linea relativos dentro de netrw.
  autocmd FileType netrw setlocal relativenumber

    " Abre archivo en VSCode.
  autocmd FileType netrw nnoremap <buffer> <leader>o :call OpenNetrwFileInVSCode()<CR>

augroup END

augroup ctrlp_updates

    " Abre archivo en VSCode.
    autocmd FileType ctrlp nnoremap <buffer> <C-v> :call OpenCtrlpFileInVSCode()<CR>

augroup END

" Comandos válidos para la ventana de preview que se abre con :copen.
augroup quickfix_preview
    autocmd!
    
    " Llama a la función que visualiza el archivo debajo del cursor.
    autocmd FileType qf autocmd CursorMoved <buffer> call QuickfixPreview()
augroup END

" Permite seguir trabajando donde estaba cuando se abre :copen.
augroup QuickfixOpen
    autocmd!
    autocmd QuickFixCmdPost vimgrep copen | wincmd p
augroup END

" Configuración de colores.
" Lista de preferencias: desert, evening, habamax, lunaperche, quiet, wombat.
let g:lightline = {
  \ 'colorscheme': 'desert',
  \ }
colorscheme desert

" Muestra combinaciones de teclas.
set showcmd

" Elimina el tiempo de espera en combinaciones de teclas.
set notimeout
set nottimeout

" Habilita filetype.
filetype plugin on
filetype indent on

" Define un comportamiento normal de backspace.
set backspace=indent,eol,start

" Permite que el cursor este en cualquier lugar, incluso sin carácter.
" Ayuda a usar el cursor como guía de indentación del código
" mientras se navega verticalmente.
set virtualedit=all

" Muestra caracteres para saltos de línea y tabs.
"set list
"set listchars=eol:↲,tab:»·,trail:·

" Abre el archivo vimrc.
nmap <leader>v<leader> :edit ~/.vim/vimrc<enter>

" Recarga el archivo vimrc.
nmap <leader><leader>v :source ~/.vim/vimrc<enter>

" Guardado rápido.
nmap <leader>w :w!<cr>

" Cierra la ventana actual.
nmap <leader>q<leader> :q<cr>

" Cierra la ventana actual sin guardar.
" Usar el comando ZQ.

" Cierra Vim si todos los buffers ya están guardados.
nmap <leader>qa :qa<cr>

" Deja un mínimo de 5 líneas entre el cursor y los bordes superior e inferior.
set so=5

" Resalta la columna donde está el cursor.
set cursorcolumn

" Modo normal: accede al tag bajo el cursor.
nmap <leader><leader>t <C-]>

" Modo normal: copia desde el cursor hasta fin de línea.
map Y y$

" Atajo para mostrar registros.
nnoremap <leader>r<leader> :registers<enter>

" Abre / cierra :copen.
nnoremap <leader>cq :call ToggleQuickfix()<CR>

" Mapeos para moverse a través de los resultados de :vimgrep.
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprevious<CR>zz

" Siempre muestra la linea de estado.
set laststatus=2

" Muestra opciones de línea de comando al presionar Tab.
set wildmenu

" Muestra el número de línea absoluto de la línea actual y el número relativo en las demás.
set number
set relativenumber

" Mantiene el cursor en la misma columna después de desplazarse.
set nostartofline

" Alterna las opciones 'number' y 'relativenumber'.
nmap <leader>sn :set number!<enter>:set relativenumber!<enter>

" Habilita el mouse para desplazamiento y redimensionado.
set mouse=a

" Configura plegado por indentación, pero lo deshabilita por defecto.
" También fija 4 columnas para niveles de plegado a la izquierda.
set foldmethod=indent
set nofoldenable
set foldcolumn=4

" Modo normal: agrega atajo para saltar al siguiente plegado cerrado.
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

" Lee archivos automáticamente si fueron modificados.
set autoread

" Incrementa el historial de deshacer.
set history=1000

" Deshabilita sonido en errores y muestra una pantalla en blanco.
set noerrorbells
set visualbell

" Altura de la barra de comandos.
set cmdheight=2

" Ignora mayúsculas/minúsculas al buscar.
set ignorecase

" Resalta resultados de búsqueda.
set hlsearch

" Hace que la búsqueda funcione como en navegadores modernos.
set incsearch

" Desactiva incsearch solo mientras se escribe :s (tambien con rango, ej. :%s).
augroup substitute_cmdline_incsearch
    autocmd!
    autocmd CmdlineChanged : if substitute(getcmdline(), '^[%0-9,.$''+-]*', '', '') =~# '^s\>' && !exists('g:substitute_prev_incsearch') | let g:substitute_prev_incsearch = &incsearch | set noincsearch | elseif substitute(getcmdline(), '^[%0-9,.$''+-]*', '', '') !~# '^s\>' && exists('g:substitute_prev_incsearch') | let &incsearch = g:substitute_prev_incsearch | unlet g:substitute_prev_incsearch | endif
    autocmd CmdlineLeave : if exists('g:substitute_prev_incsearch') | let &incsearch = g:substitute_prev_incsearch | unlet g:substitute_prev_incsearch | endif
augroup END

" Restaura incsearch al salir del :vimgrep iniciado por VimgrepProject.
augroup vimgrep_cmdline_incsearch
    autocmd!
    autocmd CmdlineLeave : if exists('g:vimgrep_prev_incsearch') | let &incsearch = g:vimgrep_prev_incsearch | unlet g:vimgrep_prev_incsearch | endif
augroup END

" Muestra el paréntesis complementario cuando el cursor está sobre uno.
set showmatch 

" Subraya la línea actual.
set cursorline

" Habilita resaltado de sintaxis.
syntax enable

" Establece UTF8 como codificación por defecto.
set encoding=utf8

" Establece el formato de fin de línea.
set fileformat=unix

" Deshabilita backup.
set nobackup
set nowb
set noswapfile

" Usa espacios en lugar de tabs.
set expandtab

" Habilita tabs inteligentes.
set smarttab

" 1 tab = 4 espacios.
set shiftwidth=4
set tabstop=4

" Establece separación de línea en 500 caracteres.
set lbr
set tw=500

" Establece autoindentación e indentación inteligente.
set ai
set si

" Configura el ajuste de línea.
set nowrap

" Modo visual: busca hacia adelante o hacia atrás la selección actual,
" al presionar * o #, respectivamente.
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Prepara :vimgrep con la palabra bajo el cursor o con la selección visual,
" para que se pueda completar el filtro de archivos al final.
nnoremap <silent> <leader>* :call VimgrepProject(0)<CR>
vnoremap <silent> <leader>* :<C-u>call VisualSelection('', '')<CR>:call VimgrepProject(1)<CR>

" Ingresa comando de sustitución con la palabra bajo el cursor como
" patrón de búsqueda (primera línea) o con selección visual (segunda).
nnoremap <leader><leader>s :%s/<C-r><C-w>//gc<left><left><left>
vnoremap <leader><leader>s :<C-u>call VisualSelection('', '')<CR>:%s/<C-R>=@/<CR>//gc<left><left><left>

" Modo visual: envuelve la selección entre distintos elementos.
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $q <esc>`>a"<esc>`<i"<esc>
inoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
inoremap $< <esc>`>a><esc>`<i<<esc>

" Modo inserción: crea parentesis/corchetes/comillas y deja el cursor dentro.
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $" ""<esc>i
inoremap $' ''<esc>i
inoremap $< <><esc>i

" Mapea <space> a / (búsqueda hacia adelante) y ctrl-<space> a ? (atrás).
map <space> /
map <c-space> ?

" Se mueve entre ventanas.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Mapeos útiles de ventanas.
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
if g:env == "WINDOWS"
  map <leader>t<leader><leader> :tabnext g:tabAnterior<enter>
else
  map <leader>t<leader><leader> :tabnext #<enter>
endif
 
" Mapear la función a <leader>v (o la tecla que prefieras)
nnoremap <leader>o :call OpenCurrentFileInVSCode()<CR>

" Muestra directorio de trabajo actual.
noremap <leader><leader>cd :pwd<cr>

" Cambia el directorio de trabajo actual al del archivo actual.
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Mapeos de buffers.
nmap <leader>b<leader> :buffers<enter>
nmap <leader>bd :bw<space>
nmap <leader>ba :b<space>#<enter>
nmap <leader>bo :buffers<enter>:b<space>

" Vuelve a la última posición al abrir un archivo.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Mueve una línea de texto.
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Mapeos útiles para espaciado de líneas.
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


"""""""""""""""""""""""
" Mapeos para plugins "
"""""""""""""""""""""""

" Alterna el explorador de Netrw.
nnoremap <C-t> :Lexplore<CR>


"""""""""""""""""""""""""""
" Definición de funciones "
"""""""""""""""""""""""""""

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

" Prepara :vimgrep en la línea de comandos usando la palabra bajo el cursor
" o el patrón de búsqueda actual, sin ejecutarlo automáticamente.
function! VimgrepProject(use_last_search)
    if a:use_last_search
        let l:pattern = @/
    else
        let l:word = expand('<cword>')
        if empty(l:word)
            echo "No hay palabra debajo del cursor."
            return
        endif
        let l:pattern = '\<' . escape(l:word, '\') . '\>'
    endif

    let g:vimgrep_prev_incsearch = &incsearch
    set noincsearch
    call feedkeys(':vimgrep /' . escape(l:pattern, '/') . '/gj **/*', 'n')
endfunction

" Abre en VSCode el archivo de netrw bajo el cursor,
" reutilizando la instancia abierta de VSCode.
function! OpenNetrwFileInVSCode()
    
    " Obtiene el directorio de trabajo actual del buffer de netrw.
    let l:dir = b:netrw_curdir
    
    " Obtiene el nombre de archivo bajo el cursor.
    let l:file = expand('<cfile>')

    " Construye la ruta.
    let l:path = l:dir . '/' . l:file
    
    " Ejecuta VSCode en silencio, reutilizando la ventana ya abierta.
    silent execute '!code -r ' . shellescape(l:path)
    
    " Redibuja la pantalla.
    redraw!

endfunction

" Abre en VSCode el buffer actual,
" reutilizando la instancia abierta de VSCode.
function! OpenCurrentFileInVSCode()

    " Obtiene la ruta absoluta del buffer actual.
    let l:filepath = expand('%:p')
    
    " Verifica si el buffer aun no está guardado.
    if l:filepath ==# ''
        echo "Error: el buffer actual no tiene un archivo guardado."
        return
    endif
    
    " Abre VSCode.
    silent execute '!code -r ' . shellescape(l:filepath)
    
    " Redibuja la pantalla.
    redraw!

endfunction

" Abre en VSCode el archivo seleccionado en ctrlp.
function! OpenCtrlpFileInVSCode()
    let l:file = ctrlp#getcline()
    silent execute '!code -r ' . shellescape(l:file)
endfunction

" Abre / cierra :copen.
function! ToggleQuickfix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        botright copen
        wincmd p
    else
        cclose
    endif
endfunction
