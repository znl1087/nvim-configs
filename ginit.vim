" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    " if windows
    if has('win32') || has('win64')
        GuiFont! JetBrainsMono NFM:h12
        " if mac
    else
        GuiFont! JetBrainsMono Nerd Font Mono:h14
    endif
else
    if has('win32') || has('win64')
        set guifont=JetBrainsMono\ NFM:h12
        " if mac
    else
        set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h14
    endif
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
" if exists(':GuiPopupmenu')
"     GuiPopupmenu 0
" endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
