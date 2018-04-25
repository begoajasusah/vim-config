" Plugins are managed by NeoBundle. Once VIM is open run :NeoBundleInstall to
" install plugins.
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins requiring no additional configuration or keymaps
  NeoBundle "michaeljsmith/vim-indent-object"
  NeoBundle "oscarh/vimerl"
  NeoBundle "pangloss/vim-javascript"
  NeoBundle "tomtom/tcomment_vim"
  NeoBundle "tpope/vim-endwise"
  NeoBundle "tpope/vim-fugitive"
  NeoBundle "tpope/vim-repeat"
  NeoBundle "vim-ruby/vim-ruby"
  NeoBundle "vim-scripts/L9"
  NeoBundle "vim-scripts/matchit.zip"
  NeoBundle "tpope/vim-abolish"

 " Vim airline configs
  NeoBundle 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Easy motion config
  NeoBundle "Lokaltog/vim-easymotion"

"Supertab code completion"
  NeoBundle "ervandew/supertab"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"

" CtrlP
  NeoBundle "kien/ctrlp.vim"
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>

    " respect the .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Go
  NeoBundle "fatih/vim-go"
    au BufNewFile,BufRead *.go set filetype=go

" Slim
  NeoBundle "slim-template/vim-slim"
    au BufNewFile,BufRead *.slim set filetype=slim

" AG aka The Silver Searcher
  NeoBundle 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  NeoBundle "majutsushi/tagbar"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  NeoBundle "tpope/vim-markdown"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  NeoBundle "scrooloose/nerdtree"
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>

  NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

  let g:NERDTreeShowIgnoredStatus = 1

  NeoBundle 'mhinz/vim-signify'
  NeoBundle 'airblade/vim-gitgutter'

" Tabular for aligning text
  NeoBundle "godlygeek/tabular"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  NeoBundle "vim-scripts/ZoomWin"
    map <Leader>z :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  NeoBundle "tpope/vim-unimpaired"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv

" Syntastic for catching syntax errors on save
  NeoBundle "scrooloose/syntastic"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass','vue', 'java'] }


" gundo for awesome undo tree visualization
  NeoBundle "sjl/gundo.vim"
    map <Leader>h :GundoToggle<CR>

" surround for adding surround 'physics'
  NeoBundle "tpope/vim-surround"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Elixir plugin
  NeoBundle "elixir-lang/vim-elixir"
    au BufNewFile,BufRead *.ex set filetype=elixir
    au BufNewFile,BufRead *.exs set filetype=elixir

" Rust!
  NeoBundle 'wting/rust.vim'

" Elm support -- https://elm-lang.org
  NeoBundle "ElmCast/elm-vim"
  " Disable provided keybindings
  let g:elm_setup_keybindings = 0
  " Format on save (needs elm-format installed)
  let g:elm_format_autosave = 1
  " Compilation
  nmap <Leader>em <Plug>(elm-make)
  nmap <Leader>eb <Plug>(elm-make-main)
  nmap <Leader>ee <Plug>(elm-error-detail)
  " Test
  nmap <Leader>et <Plug>(elm-test)
  " REPL
  nmap <Leader>er <Plug>(elm-repl)
  " Docs
  nmap <Leader>ed <Plug>(elm-show-docs)
  nmap <Leader>ew <Plug>(elm-browse-docs)

" React JSX support
  NeoBundle "mxw/vim-jsx"
  let g:jsx_ext_required = 0

" Vue Single File Component support
  NeoBundle "posva/vim-vue"
  " REPL
  nmap <Leader>er :w<CR> :call ElmRepl()<CR>

  NeoBundle 'chase/vim-ansible-yaml'

 call neobundle#end()
