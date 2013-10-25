"--- General ---------------------------------------------
set nocompatible        "Désacitve la compatibilité avec vi
set ignorecase          "Ignore case when searching
set guioptions-=T       "Remove toolbar
set autoindent          "Turn on auto-indent
set smartindent         "Turn on intelligent auto indent
set shiftwidth=4        "Defines 4 spaces as indent size
set tabstop=4           "Nombre d'espace pour la tabulation
set softtabstop=4       "Pour que backspace supprime 4 space
set expandtab           "Expand tab into spaces
set cursorline          "Highlight the cursor line
set history=50          "Keep 50 lines in history
set laststatus=2        "2 lines of status
set scrolloff=2         "Left 2 lines above and below the cursorline when top/bottom
set incsearch           "Enable incremental searching when using /

colorscheme wombat      "Set color scheme
syntax on

"--- set the gui font ----------
if has("win32") || has("win64")
    set guifont=Consolas:h11:cANSI
endif


"--- configuration de la statusline ---------
set statusline=%F\ %y\ %r%h%w%m\ [%n]\ %=\ %l/%L\ %4c\ %3p%%\ 

filetype plugin indent on


"--- Mapping --------------------------------------------------------------
",f start Firefox with current buffer
if has("win32") || has("win64")
    nmap ,f :!start C:\Program Files\Mozilla Firefox\firefox "%"<CR>
elseif has("unix")
    nmap ,f :!chromium-browser "%"<CR>
endif

"CTRL-s save current file
map <c-s> :w<CR>
imap <c-s> <ESC>:w<CR>

"--- Buffer/Tabs managment --------------------------------
"F3 close tab / S-F3 close buffer
nmap <C-F3> :tabclose<CR>
nmap <S-F3> :bd<CR>

"CTRL-PGUP and CTRL-PGDWN va au buffer précédent/suivant
map <C-left> :tabnext<CR>
map <C-right> :tabprevious<CR>

"CTRL-PGUP and CTRL-PGDWN va au buffer précédent/suivant
map <S-left> :bnext<CR>
map <S-right> :bprevious<CR>

",n toggle line numbers
map ,n :set number!<CR>

"CTRL-n Toggle on/off la couleur de fond après une recherche
map <C-n> :set hlsearch!<CR>

"CTRL-e affiche l'exlporateur de fichier dans un nouvel onglet
map <C-e> <Esc>:Texplore<CR>


"--- Commente la ligne courante -----------------------------
function! Commentify()
    let lineNumber = line(".")
    let line = getline(lineNumber) 
    if strpart(line, 0, 2) == "//"
	call setline(lineNumber, strpart(line, 2))
    else
	call setline(lineNumber, "//" . line)
    endif
endfunction
map ,c :call Commentify()<CR>

func Eatchar(pat)
    let c=nr2char(getchar(0))
    return (c=~a:pat)?":c
endfunc

