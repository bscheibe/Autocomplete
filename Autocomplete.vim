""" Autocomplete
""" Bruce Scheibe
""" An autocomplete feature that creates a list of matches which narrows as you type.    
""" Defaults to using regex to search the current buffer for matches.


" Setup.
let g:autocomplete=1


" Command for TUI use.
ab autocomplete call ToggleAutocomplete()


if has("gui_running")
        amenu Autocomplete.Toggle\ Autocomplete :call ToggleAutocomplete()<CR>
endif


" Colors for the menu.
hi PmenuSbar ctermbg=black ctermfg=black
hi Pmenu ctermbg=green ctermfg=black


" Configure the behavior we need.
set completeopt=menuone
set completeopt-=preview
set complete=.
set omnifunc=syntaxcomplete#Complete
" set complete+=t " Add in tag-searching when looking for matches. Poor responsiveness with large tagfiles.


" Allow for pressing Tab to autocomplete the top menu item.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>\<C-y>" : "\<Tab>"


function! ToggleAutocomplete()
        if g:autocomplete
                for ch in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), '\zs')
                        execute 'inoremap <expr> '.ch.' pumvisible() ? "'.ch.'" : "'.ch.'\<C-n>\<C-p>"'
                endfor
        else
                for ch in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), '\zs')
                        execute 'iunmap <expr> '.ch
                endfor
        endif
        let g:autocomplete=!g:autocomplete
endfunction


" Initialize
call ToggleAutocomplete()
