source ~/basic.vim

" Customization

" vim-plug: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" plugins
call plug#begin()
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'wakatime/vim-wakatime'
call plug#end()

" https://stackoverflow.com/questions/99161/how-do-you-make-vim-unhighlight-what-you-searched-for
" Clear the last used search pattern
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" https://vi.stackexchange.com/questions/6468/cant-move-to-end-of-line-with-vim-on-cygwin
set virtualedit+=onemore
