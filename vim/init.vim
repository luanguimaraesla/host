" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" Powerline is a statusline plugin for vim
Plug 'powerline/powerline'

" Simple, Bright and Elegant theme form modern vims
Plug 'ayu-theme/ayu-vim'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Run your favorite search tool from Vim, with an enhanced results list.
Plug 'mileszs/ack.vim'

" The NERDTree is a file system explorer for the Vim editor
Plug 'scrooloose/nerdtree'

" This plugin adds Go language support for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" A Vim plugin which shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" Syntastic is a syntax checking plugin for Vim
Plug 'vim-syntastic/syntastic'

" Coc.nvim is written in Typescript and runs on nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" GENERAL SETTINGS
filetype plugin on                 " enable filetype plugins
syntax on
set encoding=UTF-8
set mouse=a
set synmaxcol=128                  " speed up syntax hi
set re=1                           " use older version of Regex module, this is faster in some languages
set nocompatible                   " use Vim settings, rather then Vi settings (much better!).
set backspace=indent,eol,start     " allow backspacing over everything in insert mode
set number
set wildignore=*.o,*~,*.pyc,*.swp
set paste                          " paste behaviour
set hidden                         " hidden buffers
set completeopt=menu               " disable preview code when using omni complete
set modelines=1                    " allow modelines
set number relativenumber
set nu rnu
set nobackup
set nowritebackup
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent



" AYU CONFIGURATION
set termguicolors
let ayucolor="mirage"
colorscheme ayu



" AIRLINE CONFIGURATION
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1



" GITGUTTER CONFIGURATION
let g:gitgutter_override_sign_column_highlight = 0  " keep git sign column as default (+, -, ~, etc.)
let g:gitgutter_max_signs = 10000



" HIGHLIGHT CURSOR CONFIGURATION
set cursorcolumn
set cursorline
hi CursorLine term=bold ctermfg=Yellow gui=bold guifg=Yellow
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow



" NERD TREE CONFIGURATION
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__$']  " ignore files in NERDTree
set clipboard=unnamed
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1



" SYNTASTIC CONFIGURATION
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'wsl']
let g:syntastic_aggregate_errors = 1



" GENERAL CODE CONFIGURATION
highlight BadWhitespace guibg=red ctermbg=darkred
let g:ycm_autoclose_preview_window_after_completion=1
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go
  \ match BadWhitespace /\s\+$/



" PYTHON CONFIGURATION
au BufNewFile,BufRead *.py
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4  |
  \ set textwidth=120 |
  \ set expandtab     |
  \ set autoindent    |
  \ set fileformat=unix



" HTML, JS, CSS CONFIGURATION
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2     |
  \ set softtabstop=2 |
  \ set shiftwidth=2



" GOLANG CONFIGURATION
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_operators = 1
let g:go_highlight_operators = 1
let g:go_metalinter_enabled = ['golint', 'errcheck']
let g:go_auto_type_info = 1

let g:go_fmt_command = "goimports"  " format with goimports instead of gofmt

au BufNewFile,BufRead *.go
  \ set tabstop=4        |
  \ set softtabstop=4    |
  \ set shiftwidth=4     |
  \ set textwidth=120    |
  \ set expandtab        |
  \ set autoindent       |
  \ set updatetime=500   |
  \ set signcolumn=yes   |
  \ set fileformat=unix



" ACK CONFIGURATION
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif



" -----------------------------------------COC CONFIGURATION--------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



" MAPS
nnoremap <SPACE> <Nop>
let mapleader=" "
map s <Plug>(easymotion-bd-f)
nmap <LEADER>s <Plug>(easymotion-overwin-f)
nmap <LEADER>p :CtrlPBuffer<CR>
nmap <LEADER>P :CtrlP<CR>
nmap <LEADER>t :%s/\s\+$//g<CR>
nmap <LEADER>; :Ack<Space>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-w>z :vertical res<CR>
