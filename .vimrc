set nu                              " 显示行号
set cursorline                      " 高亮当前行

set tabstop=4                       " tab缩进
set shiftwidth=4                    " 默认缩进4个空格大小
set expandtab                       " 用空格键替换制表符
set autoindent                      " 自动缩进
set smartindent                     " 智能缩进
"set cindent                        " c文件自动缩进
set autoindent                      " 自动对齐


set encoding=utf-8                  " 文件编码
set fileencoding=utf-8

set autoread                        " 文件自动检测外部更改
set confirm                         " 没有保存或文件只读时弹出确认



set whichwrap=b,s,<,>,[,] "         " 设置单词的间隙字符

set hlsearch                        " 高亮查找匹配

set ruler                           " 显示标尺，就是在右下角显示光标位置

set clipboard+=unnamed              " 同步系统剪切板

set mouse=a                         " 鼠标支持




" Vundle Section Start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 在此处添加插件
Plugin 'VundleVim/Vundle.vim'                   " let Vundle manage Vundle, required
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on
" Vundle Section End


" vim vim-airline
set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩

let g:airline_theme="luna"

"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#symbol = '!'

"语法高亮
syntax on
syntax enable
colorscheme monokain
set t_Co=256  " vim-monokain now only support 256 colours in terminal.


"git gutter
"let g:gitgutter_realtime = 1
set updatetime=500
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end
