set number

set nocompatible              " be iMproved, required

filetype plugin indent on " required

" set plugins to be installed near this config file (regardless of platform)
if has('unix')
    set shell=bash
    let plugdir='~/.vim/plugged'
else
    let plugdir='~/vimfiles/plugged'
    set dictionary+=~/vimfiles/words
endif

call plug#begin(plugdir)
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'jnurmine/Zenburn'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'honza/vim-snippets'

Plug 'mattn/emmet-vim'

Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'

" vim-polyglot is slow
"Plug 'sheerun/vim-polyglot'  
Plug 'ziglang/zig.vim'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary' 
 
Plug 'gruvbox-community/gruvbox'

Plug 'scrooloose/nerdtree'

Plug 'vim-syntastic/syntastic'
Plug 'bling/vim-airline'

Plug 'frazrepo/vim-rainbow'

Plug 'easymotion/vim-easymotion'

Plug 'djoshea/vim-autoread'
Plug 'jordwalke/AutoComplPop'
call plug#end()            " required

let g:indent_guides_enable_on_vim_startup = 1

filetype plugin indent on    " required

" this is not vi
set nocompatible

" fuzzy file finding
set path+=**

" Display matching files when you tab complete
set wildmode=longest,list,full
set wildmenu


" tagging and jumping to tags
command! MakeTags !ctags -R .

set t_Co=256

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" easymotion settings =================================
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" highlight text search results ========================
set hlsearch

" netrw file browser settings 
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" :e a folder to open a file browser
" <CR>/v/t to open in an h-split/v-split/tab
" |netrw-browse-maps| has more mappings

set showcmd

" vim airline switch tabs =======================
nnoremap <leader>f :bnext<CR>
nnoremap <leader>b :bprevious<CR>

set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set autoindent

" leave this to enable only if you do not run vim-polyglot
syntax enable
colorscheme gruvbox

set listchars=tab:T>
set list

" rainbow delimiter settings ============================
let g:rainbow_active = 1

" get rid of insert text
set noshowmode

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
"
" update the file when written ==========================
set autoread
au CursorHold * checktime

" airline settings ==========================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'

" set backspace to be normal =================================
set backspace=2
set ruler

" Files and backups, swap files ================================
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

set laststatus=2

set clipboard=unnamed

if has('mouse')
    set mouse=a
endif

"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=1000

" don't give |ins-completion-menu| messages.
set shortmess+=c

" set completion menu height 
set pumheight=10

" always show sign columns
set signcolumn=yes

" completion options
set completeopt-=preview
set completeopt+=longest,menuone,noselect
set complete=.,b,u,t,k
set wildmode=list:full

imap <expr> <c-s> (pumvisible()?"\<c-y>":"")."\<plug>snipMateNextOrTrigger"
let g:UltiSnipsExpandTrigger = '<C-r>'  " Use something different from <tab>
"
" nerdtree settings =======================================
map <C-n> :NERDTreeToggle<CR>

" spell check ================================================
set spelllang=en_us
set spell
"
" KEYBINDS
"
" ^] to go to tag declaration
" g^] to show all declarations
" use ^t to jump up the tag stack
"
" AUTOCOMPLETE ==============================================
" The auto completion window should come up automatically
" 
" ^x^n for completion for just this file
" ^f^n to complete file names
" ^x^] for tag completion
" ^n for anything in the 'complete' option
"
" ^n and ^p to go up and down completion list
"
" NERDTREE ======================================================
" ^n to toggle it
"
"
" # Global
"
"     :help keyword - open help for keyword
"     :saveas file - save file as
"     :close - close current pane
"     K - open man page for word under the cursor
" # Cursor movement
"
"     h - move cursor left
"     j - move cursor down
"     k - move cursor up
"     l - move cursor right
"     H - move to top of screen
"     M - move to middle of screen
"     L - move to bottom of screen
"     w - jump forwards to the start of a word
"     W - jump forwards to the start of a word (words can contain punctuation)
"     e - jump forwards to the end of a word
"     E - jump forwards to the end of a word (words can contain punctuation)
"     b - jump backwards to the start of a word
"     B - jump backwards to the start of a word (words can contain punctuation)
"     % - move to matching character (default supported pairs: '()', '{}', '[]' - use <code>:h matchpairs</code> in vim for more info)
"     0 - jump to the start of the line
"     ^ - jump to the first non-blank character of the line
"     $ - jump to the end of the line
"     g_ - jump to the last non-blank character of the line
"     gg - go to the first line of the document
"     G - go to the last line of the document
"     5G - go to line 5
"     fx - jump to next occurrence of character x
"     tx - jump to before next occurrence of character x
"     Fx - jump to previous occurence of character x
"     Tx - jump to after previous occurence of character x
"     ; - repeat previous f, t, F or T movement
"     , - repeat previous f, t, F or T movement, backwards
"     } - jump to next paragraph (or function/block, when editing code)
"     { - jump to previous paragraph (or function/block, when editing code)
"     zz - center cursor on screen
"     Ctrl + e - move screen down one line (without moving cursor)
"     Ctrl + y - move screen up one line (without moving cursor)
"     Ctrl + b - move back one full screen
"     Ctrl + f - move forward one full screen
"     Ctrl + d - move forward 1/2 a screen
"     Ctrl + u - move back 1/2 a screen
"
" Tip Prefix a cursor movement command with a number to repeat it. For example, 4j moves down 4 lines.
" Insert mode - inserting/appending text
"
"     i - insert before the cursor
"     I - insert at the beginning of the line
"     a - insert (append) after the cursor
"     A - insert (append) at the end of the line
"     o - append (open) a new line below the current line
"     O - append (open) a new line above the current line
"     ea - insert (append) at the end of the word
"     Esc - exit insert mode
"
" # Editing
"
"     r - replace a single character
"     J - join line below to the current one with one space in between
"     gJ - join line below to the current one without space in between
"     gwip - reflow paragraph
"     cc - change (replace) entire line
"     C - change (replace) to the end of the line
"     c$ - change (replace) to the end of the line
"     ciw - change (replace) entire word
"     cw - change (replace) to the end of the word
"     s - delete character and substitute text
"     S - delete line and substitute text (same as cc)
"     xp - transpose two letters (delete and paste)
"     u - undo
"     Ctrl + r - redo
"     . - repeat last command
"
" # Marking text (visual mode)
"
"     v - start visual mode, mark lines, then do a command (like y-yank)
"     V - start linewise visual mode
"     o - move to other end of marked area
"     Ctrl + v - start visual block mode
"     O - move to other corner of block
"     aw - mark a word
"     ab - a block with ()
"     aB - a block with {}
"     ib - inner block with ()
"     iB - inner block with {}
"     Esc - exit visual mode
"
" # Visual commands
"
"     > - shift text right
"     < - shift text left
"     y - yank (copy) marked text
"     d - delete marked text
"     ~ - switch case
"
" # Registers
"
"     :reg - show registers content
"     "xy - yank into register x
"     "xp - paste contents of register x
"
" Tip Registers are being stored in ~/.viminfo, and will be loaded again on next restart of vim.
" Tip Register 0 contains always the value of the last yank command.
" Marks
"
"     :marks - list of marks
"     ma - set current position for mark A
"     `a - jump to position of mark A
"     y`a - yank text to position of mark A
"
" # Macros
"
"     qa - record macro a
"     q - stop recording macro
"     @a - run macro a
"     @@ - rerun last run macro
"
" # Cut and paste
"
"     yy - yank (copy) a line
"     2yy - yank (copy) 2 lines
"     yw - yank (copy) the characters of the word from the cursor position to the start of the next word
"     y$ - yank (copy) to end of line
"     p - put (paste) the clipboard after cursor
"     P - put (paste) before cursor
"     dd - delete (cut) a line
"     2dd - delete (cut) 2 lines
"     dw - delete (cut) the characters of the word from the cursor position to the start of the next word
"     D - delete (cut) to the end of the line
"     d$ - delete (cut) to the end of the line
"     x - delete (cut) character
"
" # Exiting
"
"     :w - write (save) the file, but don't exit
"     :w !sudo tee % - write out the current file using sudo
"     :wq or :x or ZZ - write (save) and quit
"     :q - quit (fails if there are unsaved changes)
"     :q! or ZQ - quit and throw away unsaved changes
"     :wqa - write (save) and quit on all tabs
"
" # Search and replace
"
"     /pattern - search for pattern
"     ?pattern - search backward for pattern
"     \vpattern - 'very magic' pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)
"     n - repeat search in same direction
"     N - repeat search in opposite direction
"     :%s/old/new/g - replace all old with new throughout file
"     :%s/old/new/gc - replace all old with new throughout file with confirmations
"     :noh - remove highlighting of search matches
"
" # Search in multiple files
"
"     :vimgrep /pattern/ {file} - search for pattern in multiple files
"
" e.g.:vimgrep /foo/ **/*
"
"     :cn - jump to the next match
"     :cp - jump to the previous match
"     :copen - open a window containing the list of matches
"
" # Working with multiple files
"
"     :e file - edit a file in a new buffer
"     :bnext or :bn - go to the next buffer
"     :bprev or :bp - go to the previous buffer
"     :bd - delete a buffer (close a file)
"     :ls - list all open buffers
"     :sp file - open a file in a new buffer and split window
"     :vsp file - open a file in a new buffer and vertically split window
"     Ctrl + ws - split window
"     Ctrl + ww - switch windows
"     Ctrl + wq - quit a window
"     Ctrl + wv - split window vertically
"     Ctrl + wh - move cursor to the left window (vertical split)
"     Ctrl + wl - move cursor to the right window (vertical split)
"     Ctrl + wj - move cursor to the window below (horizontal split)
"     Ctrl + wk - move cursor to the window above (horizontal split)
"
" # Tabs
"
"     :tabnew or :tabnew file - open a file in a new tab
"     Ctrl + wT - move the current split window into its own tab
"     gt or :tabnext or :tabn - move to the next tab
"     gT or :tabprev or :tabp - move to the previous tab
"     #gt - move to tab number #
"     :tabmove # - move current tab to the #th position (indexed from 0)
"     :tabclose or :tabc - close the current tab and all its windows
"     :tabonly or :tabo - close all tabs except for the current one
"     :tabdo command - run the command on all tabs (e.g. :tabdo q - closes all opened tabs)
"
" # Plugin commands (custom bound ones)
"
"     Ctrl + n - toggle NerdTree
"     Ctrl + p - open a fuzzy file finder
" ## easymotion
"     \ j - easymotion forward line selection
"     \ k - easymotion backward line selection
"     \ s - easymotion search for 2 characters
"     \ L - easymotion select lines
"     \ w - easymotion word selection
" ## fugitive
"     :Gstatus - opens a git status window
"     :G ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"         within that window
"         g? - bring up commands and keybinds for that window
"         s - stage file
"         u - unstage file
"         - - toggle staging for item under cursor
"         U - unstage everything
"         X - discard changes under cursor
"         = - toggle an inline diff of the file under the cursor
"     :Gcommit - commit file
"     :Gmerge - merge git branches
"     :Gdelete - git rm
"     :Gmove - git mv
"     :Gpush - git push
"
" ## NerdCommenter
"     <leader>cc - comment out current line in visual mode or selected text
"     <leader>c<space> - Toggles the comment state fo the selected lines
"     <leader>cs - Comments lines in a better looking block format
