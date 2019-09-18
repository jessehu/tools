set encoding=utf-8

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Turn on the verboseness to see everything vim is doing.
"set verbose=9

" Set color theme
color desert

" Show line number
"set nu
"set numberwidth=4 
"set nuw=6

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 2 spaces for indenting
set shiftwidth=2

set tabstop=2
set smarttab

" Spaces instead of tabs
set expandtab

" Always set auto indenting on
set autoindent
set cindent
set smartindent

" keep original indent when doing paste: set paste
" enable autoindent when press <ENTER>: set nopaste
set paste

" Toggle paste/nopaste mode
set pastetoggle=<F4>

" jump to previous/next line when hitting the begin/end of a line
set whichwrap=b,s,h,l,<,>,[,]

" { -> { }
"imap { {<cr>}<up><C-o>$<cr>
"ab [ {<cr>}<up><C-o>$<cr>

" select when using the mouse
set selectmode=mouse

" do not keep a backup files 
set nobackup
set nowritebackup

if has('gui_running')
    " i like about 80 character width lines
    set textwidth=78
    " Set 52 lines for the display
    set lines=52
    " 2 for the status line.
    set cmdheight=2
    " add columns for the Project plugin
    set columns=110
    " enable use of mouse
    set mouse=a
    " for the TOhtml command
    let html_use_css=1
endif

" keep 50 lines of command line history
set history=50  

" show the cursor position all the time
set ruler       

" show (partial) commands
set showcmd     

" do incremental searches (annoying but handy);
set incsearch 

" Show  tab characters. Visual Whitespace.
"set list
"set listchars=tab:>.

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
set scs

" Set 'g' substitute flag on
" set gdefault

" Set vim to use 'short messages'.
" set shortmess=a

" Insert two spaces after a period with every joining of lines.
" I like this as it makes reading texts easier (for me, at least).
set joinspaces

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" allow tilde (~) to act as an operator -- ~w, etc.
set notildeop

" highlight strings inside C comments
let c_comment_strings=1

" Commands for :Explore
let g:explVertical=1    " open vertical split winow
let g:explSplitRight=1  " Put new window to the right of the explorer
let g:explStartRight=0  " new windows go to right of explorer window


if has("gui")
  " set the gui options to:
     g: grey inactive menu items
     "m: display menu bar
     r: display scrollbar on right side of window
     b: display scrollbar at bottom of window
  "   t: enable tearoff menus on Win32
  "   T: enable toolbar on Win32
  set go=gmr
  set guifont=Courier
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "set hlsearch
  hi search guibg=LightBlue 
endif

" ************************************************************************
" C O M M A N D S
"

"switch to directory of current file
command! CD cd %:p:h

" ************************************************************************
" K E Y   M A P P I N G S
"
let mapleader=","
map <Leader>e :Explore<cr>
map <Leader>s :Sexplore<cr> 

" pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" map ,L mz1G/Last modified:/e<Cr>CYDATETIME<Esc>`z
map ,L    :let @z=TimeStamp()<Cr>"zpa
map ,datetime :let @z=strftime("%d %b %Y %X")<Cr>"zpa
map ,date :let @z=strftime("%d %b %Y")<Cr>"zpa

" ************* My Settings **************
" Map <c-s> to write current buffer.
"nmap <M-s> :w<cr>
noremap <F2> :w<cr>
"map <M-s> <esc><M-s>

" ESC shortcut
imap <C-l> <esc>:
map <F9> <esc>:
map <c-p> :last<cr>

" Buffer naviation
nnoremap <C-Tab> :bnext<CR>
nmap <A-m> :bnext<CR>
map <C-m> :bnext<CR>

" Select all.
map <c-a> ggVG

" Undo in insert mode.
imap <c-z> <esc>ui

" Save file
imap <c-k> <esc>:w!<cr>

"" tiny shortkey mapping 
nmap ; :
nmap z ZZ

" ************************************************************************
" B E G I N  A U T O C O M M A N D S
"
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Normally don't automatically format 'text' as it is typed, only do this
  " with comments, at 79 characters.
  au BufNewFile,BufEnter *.c,*.h,*.java,*.jsp,*.rb set formatoptions-=t tw=79

  " add an autocommand to update an existing time stamp when writing the file 
  " It uses the functions above to replace the time stamp and restores cursor 
  " position afterwards (this is from the FAQ) 
  autocmd BufWritePre,FileWritePre *   ks|call UpdateTimeStamp()|'s


endif " has("autocmd")


" ************************************************************************
" A B B R E V I A T I O N S 
"
abbr #b /************************************************************************
abbr #e  ************************************************************************/

" abbreviation to manually enter a timestamp. Just type YTS in insert mode 
iab YTS <C-R>=TimeStamp()<CR>

" Date/Time stamps
" %a - Day of the week
" %b - Month
" %d - Day of the month
" %Y - Year
" %H - Hour
" %M - Minute
" %S - Seconds
" %Z - Time Zone
iab YDATETIME <c-r>=strftime(": %a %b %d, %Y %H:%M:%S %Z")<cr>

" PHP
abbr pf public function()<cr>{<up><up><esc>$bi


" ************************************************************************
"  F U N C T I O N S
"

" first add a function that returns a time stamp in the desired format 
if !exists("*TimeStamp")
    fun TimeStamp()
        return "Last-modified: " . strftime("%d %b %Y %X")
    endfun
endif

" searches the first ten lines for the timestamp and updates using the
" TimeStamp function
if !exists("*UpdateTimeStamp")
function! UpdateTimeStamp() 
   " Do the updation only if the current buffer is modified 
   if &modified == 1 
       " go to the first line
       exec "1" 
      " Search for Last modified: 
      let modified_line_no = search("Last-modified:") 
      if modified_line_no != 0 && modified_line_no < 10 
         " There is a match in first 10 lines 
         " Go to the : in modified: 
         exe "s/Last-modified: .*/" . TimeStamp()
     endif
 endif
 endfunction
endif

"------------------------------------------------------------------------------
"" Local settings.
"------------------------------------------------------------------------------
"
"" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

"-------------------------------------------
"' Abbreviations
ab println System.out.println("");
ab vv var_export(, true);

"---------------------------
"" Code completion
set complete=i,],.,b,w,t,k,.

"---------------------------
"" Folding
"set foldmethod=indent 
"set foldlevel=100 
"set foldnestmax=2 
"set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:- 
"map F :let &fen = !&fen

map ff gf
map gc gdb<C-W>f 
set path+=.,

" ctag & taglist
nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
let Tlist_WinWidth=20
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let tlist_php_settings = 'PHP;c:Class;i:Interface;f:Function;d:Constant'

" Set status line
set statusline=%5l,\ %02c%2V\ \ %P%*\ [%02n]\ %f\ %(\[%M%R%H]%)%=
hi statusline ctermfg=gray ctermbg=black

" Always display a status line at the bottom of the window
set laststatus=2
