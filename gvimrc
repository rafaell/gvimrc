"rename this file to ".gvimrc"


"sintax ativada
syntax on

"tema escolhido
colorscheme desert

"linhas
set number
"régua
set ruler
"tab com 4 espaços
set tabstop=4
set shiftwidth=4
"opções de backup/swap
set backup
set backupdir=/tmp
set dir=/tmp
set uc=50

"opções de busca
set is hls ic scs magic

"showmach -> mostra par de parênteses
set sm

"AutoWrite -> gravação automática
set autowrite

"esconde o mouse :S
set mousehide

set ffs=unix,dos

set noeol

"AutoIndent
set ai
""set noci
""set si
""set et
""set smarttab
set foldmethod=manual

"encurta mensagens de rodapé
set shm=filmnrwxt

"converte tabs por espaços
""set et
""retab

"comportamento do backspace
set backspace=indent,eol,start

"background preto
set background=dark

"quebra a linha
set nowrap

"pisca a tela ao invés de apitar
set visualbell

"coloca 3 espaços após o . qunado usando o gq
set nojoinspaces

"compeltação do TAB igual ao bash
set wildmode=longest,list:full

"50 linhas de histórico
set history=300

"Configurações do VIM não do VI
set nocompatible

"Funções do mouse no teclado
set mouse=a

"Configurações para pyton
""au FileType python set ts=8 tw=80 noet
""au FileType python syn match pythonTAB '\t\+'
""au FileType python hi pythonTAB ctermbg=blue
""au FileType python set list listchars=tab:··
""au FileType python hi pythonString ctermfg=lightgrey
""au FileType python hi pythonRawString ctermfg=lightgrey

"Configurações do php
au BufNewFile,BufRead *.phps   set ft=php

"set list listchars=tab:·,trail:·,nbsp:%,precedes:&
hi list guifg=lightgreen
hi listchars guifg=lightgreen

"Espaço como page down
noremap <Space> <PageDown>

"Usa padrão iso
set fileencoding=ISO-8859-1
set enc=ISO-8859-1

"Abreviações úteis
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

"Esconder/Mostrar comentários
noremap <F2> :hi Comment guifg=SkyBlue<cr>
noremap <F3> :hi Comment term=bold guifg=#333333<cr>

"highlight resultado de buscas
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

"Mostra tab no início do texto e espaços no final
map ,mt /^\t\+\\|\s\+$<cr>

"Copia uma linha inteira para baixo
map ,cp <esc>yyp

" script que fecha caracteres '(', '{' e '['
"inoremap ( ()<esc>:call _AddChar(")")<cr>i
"inoremap { {}<esc>:call _AddChar("}")<cr>i
"inoremap [ []<esc>:call _AddChar("]")<cr>i
"inoremap \" \"\"<esc>:call _AddChar("\"")<cr>i
""inoremap ' ''<esc>:call _AddChar("'")<cr>i
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>

function! ClosePairy(char)
	if getline('.')[col('.') - 1] == a:char
       return "<Right>"
	else
		return a:char
	endif
endf

function! CloseBrackety()
	if match(getline(line('.') + 1), 's*}') < 0
		return "}"
	else
		return "<ESC>j0f}a"
	endif
endf

function! QuoteDelimy(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == '\'
	return a:char
	elseif line[col - 1] == a:char
		return <ESC><RIGHT>i
	else
		return a:char.a:char.<ESC>i
	endif
endf

function! _AddChar(schar)
    if exists("b:robstack")
        let b:robstack = b:robstack . a:schar
    else
        let b:robstack = a:schar
    endif
endfunction

nmap <F12> :<C-u>source /usr/share/vim/gvimrc <BAR> echo "Vimrc recarregado!"<CR>
map ,u :source /usr/share/vim/gvimrc<CR>  " Para recarregar o .vimrc
map ,v :e /usr/share/vim/gvimrc<CR>  " para editar o .vimrc

"coloca a data tipo Ter 26/Out/2004 hs 10:53 na linha atual
iab ,d <C-R>=strftime("%d/%b/%Y")<CR>
iab ,m Gustavo Dutra <contato@gustavodutra.com>

" volta pra última linha que estava sendo editado
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" move a linha pra baixo
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

" Abre o arquivo embaixo do mouse
nmap gf :new %:p:h/<cfile><CR>

map <F8> O/**<CR>
            \* Description<CR>
            \* @author Gustavo Dutra <contato@gustavodutra.com><cr>
            \* @created <esc>:r!date '+\%d/\%m/\%y'<cr>kJA<cr>
            \*/

" Trabalhando com buffers
map <A-1> :b1<cr>
map <A-2> :b2<cr>
map <A-3> :b3<cr>
map <A-4> :b4<cr>
map <A-5> :b5<cr>
map <A-6> :b6<cr>
map <A-7> :b7<cr>
map <A-8> :b8<cr>
map <A-9> :b9<cr>
map <A-0> :b10<cr>
map <S-F1> :b11<cr>
map <S-F2> :b12<cr>
map <S-F3> :b13<cr>
map <S-F4> :b14<cr>
map <S-F5> :b15<cr>
map <S-F6> :b16<cr>
map <S-F7> :b17<cr>
map <S-F8> :b18<cr>
map <S-F9> :b19<cr>
map <S-F10> :b20<cr>
map <S-F11> :b21<cr>
map <S-F12> :b22<cr>
map <C-Q> :bwipeout<cr>
map <F6> :buffers<cr>


map ,s <ESC>:w<cr>
map ,q <ESC>:x<cr>
nmap n nzz
map ,iso <ESC>:set fileencoding=iso-8859-1<cr>:w<cr>
map ,utf <ESC>:set fileencoding=utf-8<cr>:w<cr>


"Highlight current
set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333
hi Cursor guibg=#FFFFFF guifg=#333333

""source /usr/share/vim/vim71/plugin/php-doc.vim
""inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
""nnoremap <C-P> :call PhpDocSingle()<CR>
""vnoremap <C-P> :call PhpDocRange()<CR>

vnoremap ,o zo<CR>
vnoremap ,c zf<CR>
vnoremap ,ao zO<CR>
vnoremap ,ac zM<CR>
vnoremap ,gg [z<CR>
vnoremap ,G ]z<CR>
vnoremap ,n zj<CR>
vnoremap ,p zk<CR>

map <C-F3> :TlistToggle<CR>
map <F2> :w!<CR>:!aspell check %<CR>:e! %<CR>
set guifont=Monospace\ 8

hi Pmenu guifg=#000000 guibg=#FFFFFF

augroup php
    autocmd FileType php set makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
augroup END

function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
   else
	return "\<C-X>\<C-O>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

set completeopt=menu,preview

