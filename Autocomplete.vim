""" Autocomplete
""" Bruce Scheibe
""" An autocomplete feature that creates a list of matches which narrows as you type.    
""" Defaults to using regex to search the current buffer for matches.


let g:autocomplete=1


" Colors for the menu.
hi PmenuSbar ctermbg=black ctermfg=black
hi Pmenu ctermbg=green ctermfg=black


" Configure the behavior we need.
set completeopt=menuone
set completeopt-=preview
set complete=.
set omnifunc=syntaxcomplete#Complete
" set complete+=t " Add in tag-searching when looking for matches. Very unresponsive with large tagfiles.
if has("gui_running")
        amenu Autocomplete.Toggle\ Autocomplete :call ToggleAutocomplete()<CR>
endif


" Open the menu and begin searching for matches when a new word is typed in insert mode that starts
" with an alphabetical character.
for ch in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), '\zs')
        execute 'inoremap <expr> '.ch.' pumvisible() ? "'.ch.'" : "'.ch.'\<C-n>\<C-p>"'
endfor
" Allow for pressing Tab to autocomplete the top menu item.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>\<C-y>" : "\<Tab>"


function! ToggleAutocomplete()
        let g:autocomplete=!g:autocomplete
        echo "Toggling autocomplete not implemented"
endfunction
