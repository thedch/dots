set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
# To install Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()            " required
filetype plugin indent on    " required

set term=ansi " Possibly delete this in W10
colorscheme late_evening

syntax on

set tabstop=4 " The width of a tab is set to 4.
set shiftwidth=4 " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a tab
set expandtab " Expand tabs to spaces

set number " Enable Line Numbers
set autoindent " Stays on current indent when no file-specific matching
set showmatch " Highlight matching [{()}]

set background=dark
