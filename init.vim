" Bootstrap vim-plug (https://github.com/junegunn/vim-plug)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !mkdir -p ~/.local/share/nvim/plugged
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
       	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" Plugins will be downloaded under the specified directory
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'ayu-theme/ayu-vim'
" vim-plug plugin list ends here. Plugins become visible to Vim after this call.
call plug#end()

" ----------------------------
" ---- AutoGroup Settings ----
" ----------------------------
augroup AutoGroup
    autocmd!
augroup END

command! -nargs=* Autocmd autocmd AutoGroup <args>
command! -nargs=* AutocmdFT autocmd AutoGroup FileType <args>

" Color Scheme Settings
syntax enable
set termguicolors
let ayucolor="dark"
colorscheme ayu
let airline_theme="deus"
" Fix Weird Extraneous Symbol Issue (https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes) when using some terminal emulators
" set guicursor=
" Set ZSH as default shell
set shell=/usr/bin/zsh
set clipboard=unnamedplus

set splitbelow
set splitright
"---------------------------------
"------- Term Settings------------
"---------------------------------
" Quickly create a new terminal in a new tab
tnoremap <Leader>c <C-\><C-n>:tab new<CR>:term<CR>
noremap <Leader>c :tab new<CR>:term<CR>
inoremap <Leader>c <Esc>:tab new<CR>:term<CR>

" Quickly create a new terminal in a vertical split
tnoremap <Leader>% <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>
noremap <Leader>% :vsp<CR><C-w><C-w>:term<CR>
inoremap <Leader>% <Esc>:vsp<CR><C-w><C-w>:term<CR>

" Quickly create a new terminal in a horizontal split
tnoremap <Leader>- <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>
noremap <Leader>- :sp<CR><C-w><C-w>:term<CR>
inoremap <Leader>- <Esc>:sp<CR><C-w><C-w>:term<CR>
" FZF Settings
noremap <Leader>b :Buffers<CR>
noremap <Leader>h :History<CR>
noremap <Leader>a :Ag<CR>
noremap <Leader>f :FZF<CR>
noremap <Leader>F :FZF
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>
"---------------------------------
"-------Airline Settings----------
"---------------------------------
let g:airline#extensions#ale#enabled = 1

"--------------------------------
"---------Deoplete Settings------
"--------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])
"---------------------------------
"--------Ale Settings-------------
"---------------------------------
let g:ale_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 5
let g:ale_open_list = 1
let g:ale_set_highlights = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'i'
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'ERROR'
let g:ale_echo_msg_warning_str = 'WARNING'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nnoremap <silent> <Leader>k <Plug>(ale_previous_wrap)
nnoremap <silent> <Leader>j <Plug>(ale_next_wrap)
" Close Quickfix list when file leave
Autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
" Netrw Settings
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Vim-Auto-Save Settings
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "CursorHold", "CursorHoldI"]
