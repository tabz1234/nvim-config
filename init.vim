call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sainnhe/gruvbox-material'

Plug 'rhysd/vim-clang-format'

Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()


set noswapfile
set mouse=a

set nu
colorscheme gruvbox-material

nnoremap gb :ls<cr>:b<space>

"hide search highlight
nnoremap <silent> <esc> :noh<cr><esc>

"clang-format
let g:clang_format#auto_format=1
"nnoremap <C-f> :<C-u>ClangFormat<CR>

" Automatically closing curly braces
"inoremap { {<CR>}<Esc>ko

"COC-SETTINGS   :: : :: : : : :: : "
nn <silent> K :call CocActionAsync('doHover')<cr>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set signcolumn=no
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> fd <Plug>(coc-definition)
nmap <silent> fy <Plug>(coc-type-definition)
nmap <silent> fi <Plug>(coc-implementation)
nmap <silent> rf <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap rn <Plug>(coc-rename)

" quick fix
map <space>f  <Plug>(coc-fix-current)


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>

"
