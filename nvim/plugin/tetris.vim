if exists('g:loaded_tetris') | finish | endif

let s:save_cpo = &cpo
set cpo:vim

command! Tetris lua require'tetris'.tetris()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_tetris = 1
