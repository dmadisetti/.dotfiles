" Autoformat
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
augroup END
autocmd FileType cuda let b:codefmt_formatter = 'clang-format'

" Spell checking
function! SpellToggle()
  if g:spell_checking
    setlocal nospell
    let g:spell_checking = 0
    if g:MarkDowned
      :GrammarousReset
    endif
  else
    setlocal spell
    let g:spell_checking = 1
    if g:MarkDowned
      :GrammarousCheck
    endif
  endif
endfunction

" Misc Formatting
function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" Such peace, much wow
function! Zen()
  :Goyo
  :Limelight
  if g:MarkDowned
    :SoftPencil
  endif
endfunction

command Zen :call Zen()
